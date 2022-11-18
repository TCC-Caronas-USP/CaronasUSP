import 'package:caronas_usp/app/utils/input_validators.dart';
import 'package:caronas_usp/app/widgets/appbar_widget.dart';
import 'package:caronas_usp/app/widgets/personal_information_fields.dart';
import 'package:caronas_usp/app/widgets/profile_widget.dart';
import 'package:caronas_usp/app/widgets/text_field_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget(this.onRegisterPressed, {super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Function(Map<String, dynamic> personalInfo) onRegisterPressed;
  final user = FirebaseAuth.instance.currentUser!;

  late TextEditingController name =
      TextEditingController(text: user.displayName);
  late TextEditingController email = TextEditingController(text: user.email);

  final TextEditingController _instituto = TextEditingController();
  final TextEditingController _curso = TextEditingController();
  final TextEditingController _ano = TextEditingController();
  final MaskedTextController _telefone =
      MaskedTextController(mask: PHONE_MASK, translator: {
    'A': RegExp(r'[A-Za-z]'),
    '0': RegExp(r'[0-9]'),
    '@': RegExp(r'[A-Za-z0-9]'),
    '*': RegExp(r'.*'),
    '#': RegExp(r'[0-9]?')
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Informações pessoais"),
      body: Form(
          key: _formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 12),
              ProfileWidget(
                imagePath: user.photoURL ?? "https://i.imgur.com/V4RclNb.png",
                onClicked: () {},
              ),
              const SizedBox(height: 12),
              TextFieldWidget(
                label: "Email",
                fieldController: email,
                enabled: false,
              ),
              const SizedBox(height: 12),
              ...getPersonalInformationFields(
                  name: name,
                  instituto: _instituto,
                  curso: _curso,
                  ano: _ano,
                  telefone: _telefone),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 72),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[700],
                        onPrimary: Colors.white,
                        minimumSize: const Size(double.infinity, 50)),
                    icon: const FaIcon(Icons.check),
                    label: const Text('Registrar'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Map<String, dynamic> personalInfo = {
                          "Nome": name.text,
                          "Instituto": _instituto.text,
                          "Curso": _curso.text,
                          "Ano de Ingresso": _ano.text,
                          "Telefone": _telefone.text,
                        };
                        onRegisterPressed(personalInfo);
                      }
                    }),
              ),
              const SizedBox(height: 12),
            ],
          )),
    );
  }
}
