import 'package:caronas_usp/app/modules/edit_profile/ui/edit_vehicles.dart';
import 'package:caronas_usp/app/modules/profile/bloc/profile_bloc.dart';
import 'package:caronas_usp/app/modules/profile/bloc/profile_event.dart';
import 'package:caronas_usp/app/modules/profile/bloc/profile_state.dart';
import 'package:caronas_usp/app/modules/edit_profile/ui/edit_profile_page.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/models/vehicle.dart';
import 'package:caronas_usp/app/widgets/appbar_widget.dart';
import 'package:caronas_usp/app/modules/profile/ui/infos_widget.dart';
import 'package:caronas_usp/app/modules/profile/ui/numbers_widget.dart';
import 'package:caronas_usp/app/widgets/profile_widget.dart';

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
  }

  Future<void> _handleListener(BuildContext context, ProfileState state) async {
    if (state is ProfileLoading) {
      _loading = true;
      user = null;
    }
    if (state is ProfileLoaded) {
      user = state.user;
      vehicle = user!.vehicles.isNotEmpty ? user?.vehicles.first : null;
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
                      builder: (context) => EditProfilePage(
                            rider: user!,
                          )));
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
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      ProfileWidget(
                          imagePath: user!.profileImage, onClicked: () {}),
                      const SizedBox(
                        height: 24,
                      ),
                      buildName(user!),
                      const SizedBox(
                        height: 24,
                      ),
                      NumbersWidget(
                          caronasRealizadas: user!.caronasMotorista?? 0,
                          caronasUtilizadas: user!.caronasPassageiro?? 0),
                      const SizedBox(
                        height: 24,
                      ),
                      InfosWidget(
                          infoTitle: "Telefone", infoValues: [user!.phoneNumber]),
                      const SizedBox(
                        height: 12,
                      ),
                      InfosWidget(
                          infoTitle: "Instituto",
                          infoValues: [user!.college]),
                      const SizedBox(
                        height: 12,
                      ),
                      InfosWidget(
                          infoTitle: "Curso", infoValues: [user!.course]),
                      const SizedBox(
                        height: 12,
                      ),
                      InfosWidget(
                          infoTitle: "Ano", infoValues: [user!.ingressYear.toString()]),
                      const SizedBox(
                        height: 12,
                      ),
                      if (vehicle != null)
                        InfosWidget(infoTitle: "Veículo", infoValues: [
                          vehicle!.model,
                          vehicle!.color,
                          vehicle!.licensePlate,
                          vehicle!.brand
                        ]),
                      const SizedBox(height: 12),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    EditVehicle(vehicle: vehicle)));

                            _profileBloc!.add(FetchUserInfo());
                          },
                          child: vehicle == null
                              ? const Text("Adicionar veículo")
                              : const Text("Alterar veículo")),
                      const SizedBox(height: 124),
                    ],
                  ),
          );
        });
  }

  Widget buildName(Rider user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontSize: 24),
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
