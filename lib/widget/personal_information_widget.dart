import 'package:caronas_usp/widget/appbar_backbutton_widget.dart';
import 'package:caronas_usp/widget/profile_widget.dart';
import 'package:caronas_usp/widget/text_field_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonalInformationWidget extends StatelessWidget {
  PersonalInformationWidget(this.onRegisterPressed, {super.key});

  final Function(Map<String, dynamic> personalInfo) onRegisterPressed;
  final user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic> personalInfo = {};

  void onFieldChanged(TextFieldWidget field, dynamic value) {
    personalInfo[field.label] = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarBackButton(context, "Perfil"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          ProfileWidget(
            imagePath: user.photoURL!,
            onClicked: () {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: "Nome",
            text: user.displayName!,
            enabled: false,
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: "Email",
            text: user.email!,
            enabled: false,
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
              label: "Telefone", text: "", onFieldChanged: onFieldChanged),
          const SizedBox(height: 24),
          TextFieldWidget(
              label: "Instituto", text: "", onFieldChanged: onFieldChanged),
          const SizedBox(height: 24),
          TextFieldWidget(
              label: "Curso", text: "", onFieldChanged: onFieldChanged),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: "Ano de Ingresso",
            onFieldChanged: onFieldChanged,
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 72),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green[700],
                    onPrimary: Colors.white,
                    minimumSize: const Size(double.infinity, 50)),
                icon: const FaIcon(Icons.check),
                label: const Text('Registrar'),
                onPressed: () => onRegisterPressed(personalInfo)),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
