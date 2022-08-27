import 'package:caronas_usp/widget/sign_up_widget.dart';
import 'package:caronas_usp/widget/logged_in_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return LoggedInWidget();
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