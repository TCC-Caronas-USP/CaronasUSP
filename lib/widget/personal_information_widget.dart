import 'package:caronas_usp/app/modules/login/ui/login_page.dart';
import 'package:caronas_usp/widget/appbar_backbutton_widget.dart';
import 'package:caronas_usp/widget/profile_widget.dart';
import 'package:caronas_usp/widget/text_field_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PersonalInformationWidget extends StatelessWidget{
  PersonalInformationWidget({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarBackButton(context, "Perfil"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          ProfileWidget(imagePath: user.photoURL!, onClicked: () {},),
          const SizedBox(height: 24),
          TextFieldWidget(label: "Nome", text: user.displayName!, onChanged: (nome) {}, enabled: false,),
          const SizedBox(height: 24),
          TextFieldWidget(label: "Email", text: user.email!, onChanged: (email) {}, enabled: false,),
          const SizedBox(height: 24),
          TextFieldWidget(label: "Telefone", text: "", onChanged: (telefone) {}),
          const SizedBox(height: 24),
          TextFieldWidget(label: "Instituto", text: "", onChanged: (instituto) {}),
          const SizedBox(height: 24),
          TextFieldWidget(label: "Curso", text: "", onChanged: (curso) {}),
          const SizedBox(height: 24),
          TextFieldWidget(label: "Ano de Ingresso", text: "", onChanged: (ano) {}),
          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 72),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.green[700],
                onPrimary: Colors.white,
                minimumSize: const Size(double.infinity, 50)
              ),
              icon: const FaIcon(Icons.check),
              label: const Text('Registrar'),
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                    );
              },
            ),
          ),

          const SizedBox(height: 24),

        ],
      ),
    );
  }
}