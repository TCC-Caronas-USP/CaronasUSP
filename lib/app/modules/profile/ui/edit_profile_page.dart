import 'package:caronas_usp/utils/user_preferences.dart';
import 'package:caronas_usp/widget/appbar_backbutton_widget.dart';
import 'package:caronas_usp/widget/field_wrapper_widget.dart';
import 'package:caronas_usp/widget/profile_widget.dart';
import 'package:caronas_usp/widget/text_field_widget.dart';

import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  static const user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarBackButton(context, "Perfil"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 24,
          ),
          ProfileWidget(imagePath: user.imagePath, onClicked: () async {}),
          const SizedBox(
            height: 24,
          ),
          FieldWrapper(
              fieldInput: TextFieldWidget(
                  label: "Nome", text: user.name, onChanged: (name) {})),
          FieldWrapper(
            fieldInput: TextFieldWidget(
                label: "Email", text: user.email, onChanged: (email) {}),
          ),
          FieldWrapper(
              fieldInput: TextFieldWidget(
                  label: "CPF", text: user.cpf, onChanged: (cpf) {})),
          FieldWrapper(
            fieldInput: TextFieldWidget(
                label: "Telefone",
                text: user.telefone,
                onChanged: (telefone) {}),
          ),
          FieldWrapper(
            fieldInput: TextFieldWidget(
                label: "Instituto",
                text: user.instituto,
                onChanged: (instituto) {}),
          ),
          FieldWrapper(
            fieldInput: TextFieldWidget(
                label: "Modelo do veículo",
                text: user.veiculoModelo,
                onChanged: (veiculoModelo) {}),
          ),
          FieldWrapper(
            fieldInput: TextFieldWidget(
                label: "Cor do veículo",
                text: user.veiculoCor,
                onChanged: (veiculoCor) {}),
          ),
          FieldWrapper(
            fieldInput: TextFieldWidget(
                label: "Placa do veículo",
                text: user.veiculoPlaca,
                onChanged: (veiculoPlaca) {}),
          ),
          FieldWrapper(
            fieldInput: TextFieldWidget(
                label: "Marca do veículo",
                text: user.veiculoMarca,
                onChanged: (veiculoMarca) {}),
          ),
        ],
      ),
    );
  }
}
