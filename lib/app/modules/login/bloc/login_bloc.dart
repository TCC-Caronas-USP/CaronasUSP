import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_event.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_state.dart';
import 'package:caronas_usp/app/repositories/network/onesignal_requester.dart';
import 'package:caronas_usp/app/repositories/rider_repository.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final googleSignIn = GoogleSignIn();
  final RiderRepository riderRepository;

  Rider? _rider;

  Rider? get currentRider => _rider;

  LoginBloc(this.riderRepository) : super(LoggedOut()) {
    on<TryLogin>((event, emit) async {
      emit(LoginLoading());

      LoginState loginState = await googleLogin();
      if (loginState == GoogleLoggedIn()) {
        bool riderExists = await riderRepository.checkIfRiderExists();
        if (riderExists) {
          _rider = await riderRepository.getRider(); // TODO Ao invés de chamar riderRepository 2 vezes, usar Result<T, E> para retornar Rider ou Erro. Fonte: https://gist.github.com/anoop4real/57584eb3a04ce0b9be6252401b0bde8b
          emit(LoggedIn(_rider!));
        } else {
          emit(LoggedInFirstTime());
        }
      } else {
        emit(loginState);
      }
    });

    on<Logout>((event, emit) async {
      emit(LoginLoading());

      emit(await logout());
    });

    on<Register>((event, emit) async {
      emit(LoginLoading());

      final user = FirebaseAuth.instance.currentUser!;
      Map<String, dynamic> personalInfo = event.personalInfo;

      Rider rider = Rider(
          id: 0,
          profileImage: user.photoURL!,
          name: personalInfo["Nome"],
          email: user.email!,
          phoneNumber: personalInfo["Telefone"],
          college: personalInfo["Instituto"],
          course: personalInfo["Curso"],
          ingressYear: int.parse(personalInfo["Ano de Ingresso"]),
          vehicles: []);

      try {
        rider = await riderRepository.registerRider(rider);
      } catch (e) {
        print(e);
        emit(await logout());
        return;
      }
      _rider = rider;
      emit(LoggedIn(_rider!));
    });
  }

  Future<LoginState> googleLogin() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return await logout();
    }

    if (googleUser.email.split('@').last != ALLOWED_EMAIL_DOMAIN) {
      await logout();
      return EmailDomainNotAllowed();
    }

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-disabled') {
        await logout();
        return UserBanned();
      }
      return await logout();
    } catch (e) {
      return await logout();
    }
    return GoogleLoggedIn();
  }

  Future<LoginState> logout() async {
    try {
      await OneSignalRequester.disablePush();
    } catch (e) {}
    try {
      await googleSignIn.disconnect();
    } catch (e) {}
    try {
      FirebaseAuth.instance.signOut();
    } catch (e) {}
    return LoggedOut();
  }
}
