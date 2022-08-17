import 'package:caronas_usp/model/user.dart';
import 'package:caronas_usp/utils/user_preferences.dart';
import 'package:caronas_usp/widget/infos_widget.dart';
import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:caronas_usp/widget/numbers_widget.dart';
import 'package:caronas_usp/widget/profile_widget.dart';

import 'package:flutter/cupertino.dart';
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24,),
          ProfileWidget(imagePath: user.imagePath, onClicked: () async {}),
          const SizedBox(height: 24,),
          buildName(user),
          const SizedBox(height: 24,),
          NumbersWidget(caronasRealizadas: user.caronasRealizadas, caronasUtilizadas: user.caronasUtilizadas, ranking: user.ranking),
          const SizedBox(height: 24,),
          InfosWidget(infoTitle: "CPF", infoValue: user.cpf),
          const SizedBox(height: 12,),
          InfosWidget(infoTitle: "Telefone", infoValue: user.telefone),
          const SizedBox(height: 12,),
          InfosWidget(infoTitle: "Instituto", infoValue: user.instituto),
          const SizedBox(height: 12,),
          InfosWidget(infoTitle: "Veículo", infoValue: user.veiculo),
          const SizedBox(height: 24,),
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
      const SizedBox(height: 4,),
      Text(
        user.email,
        style: const TextStyle(color: Colors.grey),
      ),
    ],
  );

}