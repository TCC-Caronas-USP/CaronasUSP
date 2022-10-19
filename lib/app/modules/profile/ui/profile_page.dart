import 'package:caronas_usp/app/modules/profile/bloc/profile_bloc.dart';
import 'package:caronas_usp/app/modules/profile/bloc/profile_event.dart';
import 'package:caronas_usp/app/modules/profile/bloc/profile_state.dart';
import 'package:caronas_usp/app/modules/profile/ui/edit_profile_page.dart';
import 'package:caronas_usp/model/rider.dart';
import 'package:caronas_usp/model/vehicle.dart';
import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:caronas_usp/widget/infos_widget.dart';
import 'package:caronas_usp/widget/numbers_widget.dart';
import 'package:caronas_usp/widget/profile_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileBloc? _profileBloc;
  Rider? user;
  Vehicle? vehicle;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _profileBloc = context.read<ProfileBloc>();
    _profileBloc!.add(FetchUserInfo());
    vehicle = user?.vehicles.first;
  }

  Future<void> _handleListener(BuildContext context, ProfileState state) async {
    if (state is ProfileLoading) {
      _loading = true;
      user = null;
    }
    if (state is ProfileLoaded) {
      user = state.user;
      _loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: _handleListener,
        builder: (BuildContext context, ProfileState state) {
          return Scaffold(
            appBar: buildAppBar(context, "Perfil"),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditProfilePage()));
                },
                backgroundColor: Colors.green[400],
                child: const Icon(Icons.edit)),
            body: _loading
                ? const SpinKitRotatingCircle(
                    color: Colors.green,
                    size: 50.0,
                  )
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      ProfileWidget(
                          imagePath: user!.imagePath, onClicked: () {}),
                      const SizedBox(
                        height: 24,
                      ),
                      buildName(user!),
                      const SizedBox(
                        height: 24,
                      ),
                      NumbersWidget(
                          caronasRealizadas: user!.caronasMotorista,
                          caronasUtilizadas: user!.caronasPassageiro,
                          ranking: user!.ranking),
                      const SizedBox(
                        height: 24,
                      ),
                      // InfosWidget(infoTitle: "CPF", infoValues: [user!.cpf]),
                      // const SizedBox(
                      //   height: 12,
                      // ),
                      InfosWidget(
                          infoTitle: "Telefone", infoValues: [user!.telefone]),
                      const SizedBox(
                        height: 12,
                      ),
                      InfosWidget(
                          infoTitle: "Instituto",
                          infoValues: [user!.instituto]),
                      const SizedBox(
                        height: 12,
                      ),
                      InfosWidget(infoTitle: "Veículo", infoValues: [
                        vehicle!.model,
                        vehicle!.color,
                        vehicle!.licensePlate,
                        vehicle!.brand
                      ]),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
          );
        });
  }

  Widget buildName(Rider user) => Column(
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
