import 'package:caronas_usp/app/modules/profile/ui/edit_profile_page.dart';
import 'package:caronas_usp/model/user.dart';
import 'package:caronas_usp/utils/user_preferences.dart';
import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:caronas_usp/widget/infos_widget.dart';
import 'package:caronas_usp/widget/numbers_widget.dart';
import 'package:caronas_usp/widget/profile_widget.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context, "Perfil"),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditProfilePage()));
          },
          backgroundColor: Colors.green[400],
          child: const Icon(Icons.edit)),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 24,
          ),
          ProfileWidget(imagePath: user.imagePath, onClicked: () {}),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
          const SizedBox(
            height: 24,
          ),
          NumbersWidget(
              caronasRealizadas: user.caronasRealizadas,
              caronasUtilizadas: user.caronasUtilizadas,
              ranking: user.ranking),
          const SizedBox(
            height: 24,
          ),
          InfosWidget(infoTitle: "CPF", infoValues: [user.cpf]),
          const SizedBox(
            height: 12,
          ),
          InfosWidget(infoTitle: "Telefone", infoValues: [user.telefone]),
          const SizedBox(
            height: 12,
          ),
          InfosWidget(infoTitle: "Instituto", infoValues: [user.instituto]),
          const SizedBox(
            height: 12,
          ),
          InfosWidget(infoTitle: "Veículo", infoValues: [
            user.veiculoModelo,
            user.veiculoCor,
            user.veiculoPlaca,
            user.veiculoMarca
          ]),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      );
}
