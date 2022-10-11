import 'package:caronas_usp/widget/forbidden_email_access_widget.dart';
import 'package:caronas_usp/widget/personal_information_widget.dart';
import 'package:caronas_usp/widget/sign_up_widget.dart';
import 'package:caronas_usp/widget/logged_in_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:caronas_usp/utils/registred_emails.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  final domain = "usp.br";
  
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          if (FirebaseAuth.instance.currentUser!.email!.split('@').last != domain) {
            return const ForbiddenEmailAccess();
          } else if (registredEmails.contains(FirebaseAuth.instance.currentUser!.email!)) {
            print(registredEmails);
            return LoggedInWidget(); 
          } else {
            print(registredEmails);
            return PersonalInformationState();
          }
        }
        else if (snapshot.hasError){
          return const Center(child: Text('Alguma coisa deu errado'));
        } else {
          return SignUpWidget();
        }
      },
    ),
  );
}