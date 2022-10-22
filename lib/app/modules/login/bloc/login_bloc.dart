import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_event.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final googleSignIn = GoogleSignIn();

  LoginBloc() : super(LoginLoading()) {
    on<LoadLogin>((event, emit) async {
      emit(LoginLoading());

      AccountStatus accountStatus = await googleSignIn.isSignedIn()
          ? AccountStatus.loggedIn
          : AccountStatus.loggedOut;

      emit(LoginLoaded(accountStatus));
    });

    on<TryLogin>((event, emit) async {
      emit(LoginLoading());

      AccountStatus accountStatus = await googleLogin();

      emit(LoginAttempted(accountStatus));
    });

    on<Logout>((event, emit) async {
      emit(LoginLoading());

      final loggedOut = await logout();

      emit(LoginAttempted(loggedOut));
    });
  }

  Future<AccountStatus> googleLogin() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return await logout();
    }

    if (googleUser.email.split('@').last != ALLOWED_EMAIL_DOMAIN) {
      return await logout(AccountStatus.domainNotAllowed);
    }

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-disabled') {
        return await logout(AccountStatus.banned);
      }
      return await logout();
    } catch (e) {
      return await logout();
    }
    return AccountStatus.loggedIn;
  }

  Future<AccountStatus> logout(
      [AccountStatus accountStatus = AccountStatus.loggedOut]) async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    return accountStatus;
  }
}
