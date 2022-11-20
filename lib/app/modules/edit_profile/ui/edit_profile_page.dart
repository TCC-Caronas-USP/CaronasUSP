import 'package:caronas_usp/app/modules/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:caronas_usp/app/modules/edit_profile/bloc/edit_profile_event.dart';
import 'package:caronas_usp/app/modules/edit_profile/bloc/edit_profile_state.dart';
import 'package:caronas_usp/app/modules/profile/ui/profile_page.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/utils/input_validators.dart';
import 'package:caronas_usp/app/widgets/appbar_backbutton_widget.dart';
import 'package:caronas_usp/app/widgets/personal_information_fields.dart';
import 'package:caronas_usp/app/widgets/profile_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditProfilePage extends StatefulWidget {
  Rider rider;

  EditProfilePage({Key? key, required this.rider}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  EditProfileBloc? _editProfileBloc;
  bool _loading = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
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
  void initState() {
    super.initState();
    _editProfileBloc = context.read<EditProfileBloc>();
    _editProfileBloc!.add(FetchRiderInfo());
  }

  Future<void> _handleListener(
      BuildContext context, EditProfileState state) async {
    if (state is EditProfileLoading) {
      _loading = true;
    }
    if (state is EditProfileLoaded) {
      widget.rider = state.user;

      _name.text = widget.rider.name;
      _instituto.text = widget.rider.college;
      _curso.text = widget.rider.course;
      _ano.text = widget.rider.ingressYear.toString();
      _telefone.text = widget.rider.phoneNumber;

      _loading = false;
    }
    if (state is EditedProfile) {
      Navigator.of(context)
          .pop(MaterialPageRoute(builder: (context) => const ProfilePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
        bloc: _editProfileBloc,
        listener: _handleListener,
        builder: (BuildContext context, EditProfileState state) {
          return Scaffold(
            appBar: buildAppBarBackButton(context, "Perfil"),
            body: _loading
                ? const SpinKitRotatingCircle(
                    color: Colors.green,
                    size: 50.0,
                  )
                : Form(
                    key: _formKey,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        ProfileWidget(
                            imagePath: widget.rider.profileImage,
                            onClicked: () async {}),
                        const SizedBox(
                          height: 24,
                        ),
                        ...getPersonalInformationFields(
                            name: _name,
                            instituto: _instituto,
                            curso: _curso,
                            ano: _ano,
                            telefone: _telefone),
                        const SizedBox(height: 12),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Atualizando informações')),
                                );

                                Rider updatedRider = Rider(
                                    profileImage: widget.rider.profileImage,
                                    name: _name.text,
                                    email: widget.rider.email,
                                    phoneNumber: _telefone.text,
                                    college: _instituto.text,
                                    course: _curso.text,
                                    ingressYear: int.parse(_ano.text),
                                    caronasMotorista:
                                        widget.rider.caronasMotorista,
                                    caronasPassageiro:
                                        widget.rider.caronasPassageiro,
                                    vehicles: widget.rider.vehicles);

                                _editProfileBloc!
                                    .add(UpdateRiderInfo(updatedRider));
                              }
                            },
                            child: const Text("Atualizar")),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
          );
        });
  }
}
