import 'package:caronas_usp/page/user_page_test.dart';
import 'package:caronas_usp/widget/appbar_backbutton_widget_copia.dart';
import 'package:caronas_usp/widget/profile_widget_copia.dart';
import 'package:caronas_usp/widget/text_field_widget_copia.dart';
import 'package:caronas_usp/widget/text_field_widget_immutable.dart';

import 'package:caronas_usp/utils/registred_emails.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

class PersonalInformationState extends StatelessWidget{
  PersonalInformationState({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarBackButton(context, "Perfil"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          ProfileWidgetImmutable(imagePath: user.photoURL!),
          const SizedBox(height: 24),
          //TODO: Queria fazer as caixas de texto imutáveis
          TextFieldWidgetImmutable(label: "Nome", text: user.displayName!, onChanged: (nome) {}),
          const SizedBox(height: 24),
          TextFieldWidgetImmutable(label: "Email", text: user.email!, onChanged: (email) {}),
          const SizedBox(height: 24),
          TextFieldWidget(label: "CPF", text: "CPF", onChanged: (cpf) {}),
          const SizedBox(height: 24),
          TextFieldWidget(label: "Telefone", text: "Telefone", onChanged: (telefone) {}),
          const SizedBox(height: 24),
          TextFieldWidget(label: "Instituto", text: "Instituto", onChanged: (instituto) {}),
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
                //TODO: queria registrar os valores dos campos de texto
                registredEmails.add(user.email!);
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserPage()),
                    );
              },
            ),
          ),

          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 72),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.red[700],
                onPrimary: Colors.white,
                minimumSize: const Size(double.infinity, 50)
              ),
              icon: const FaIcon(Icons.cancel),
              label: const Text('Cancelar'),
              onPressed: () {
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserPage()),
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