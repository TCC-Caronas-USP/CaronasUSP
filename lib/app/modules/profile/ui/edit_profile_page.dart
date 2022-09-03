import 'package:caronas_usp/utils/user_preferences.dart';
import 'package:caronas_usp/widget/appbar_backbutton_widget.dart';
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
        children: [
          const SizedBox(
            height: 24,
          ),
          ProfileWidget(imagePath: user.imagePath, onClicked: () async {}),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(label: "Nome", text: user.name, onChanged: (name) {}),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
              label: "Email", text: user.email, onChanged: (email) {}),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(label: "CPF", text: user.cpf, onChanged: (cpf) {}),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
              label: "Telefone", text: user.telefone, onChanged: (telefone) {}),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
              label: "Instituto",
              text: user.instituto,
              onChanged: (instituto) {}),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
              label: "Modelo do veículo",
              text: user.veiculoModelo,
              onChanged: (veiculoModelo) {}),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
              label: "Cor do veículo",
              text: user.veiculoCor,
              onChanged: (veiculoCor) {}),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
              label: "Placa do veículo",
              text: user.veiculoPlaca,
              onChanged: (veiculoPlaca) {}),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
              label: "Marca do veículo",
              text: user.veiculoMarca,
              onChanged: (veiculoMarca) {}),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
