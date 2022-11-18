import 'package:caronas_usp/app/modules/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:caronas_usp/app/modules/edit_profile/bloc/edit_profile_event.dart';
import 'package:caronas_usp/app/modules/edit_profile/bloc/edit_profile_state.dart';
import 'package:caronas_usp/app/modules/profile/ui/profile_page.dart';
import 'package:caronas_usp/model/rider.dart';
import 'package:caronas_usp/widget/appbar_backbutton_widget.dart';
import 'package:caronas_usp/widget/field_wrapper_widget.dart';
import 'package:caronas_usp/widget/profile_widget.dart';
import 'package:caronas_usp/widget/text_field_widget.dart';

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
      MaskedTextController(mask: '(00) 00000-0000');

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
      _instituto.text = widget.rider.instituto;
      _curso.text = widget.rider.curso;
      _ano.text = widget.rider.ano.toString();
      _telefone.text = widget.rider.telefone;

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
                            imagePath: widget.rider.imagePath,
                            onClicked: () async {}),
                        const SizedBox(
                          height: 24,
                        ),
                        FieldWrapper(
                            fieldInput: TextFieldWidget(
                          fieldController: _name,
                          label: "Nome",
                          text: _name.text,
                          suffixIcon: const Icon(Icons.text_fields_outlined),
                          onValidation: (String? value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
                        )),
                        FieldWrapper(
                          fieldInput: TextFieldWidget(
                            fieldController: _instituto,
                            label: "Instituto",
                            suffixIcon: const Icon(Icons.school_outlined),
                            text: _instituto.text,
                            onFieldChanged: (widget, instituto) {},
                            onValidation: (String? value) {
                              if (value!.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              return null;
                            },
                          ),
                        ),
                        FieldWrapper(
                          fieldInput: TextFieldWidget(
                            fieldController: _curso,
                            label: "Curso",
                            text: _curso.text,
                            suffixIcon: const Icon(Icons.school_outlined),
                            onFieldChanged: (widget, instituto) {},
                            onValidation: (String? value) {
                              if (value!.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              return null;
                            },
                          ),
                        ),
                        FieldWrapper(
                          fieldInput: TextFieldWidget(
                            fieldController: _ano,
                            label: "Ano",
                            text: _ano.text,
                            suffixIcon: const Icon(Icons.timelapse_outlined),
                            onFieldChanged: (widget, instituto) {},
                            onValidation: (String? value) {
                              if (value!.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              return null;
                            },
                          ),
                        ),
                        FieldWrapper(
                          fieldInput: TextFieldWidget(
                            fieldController: _telefone,
                            label: "Telefone",
                            text: _telefone.text,
                            suffixIcon: const Icon(Icons.phone_enabled),
                            textInputType:
                                const TextInputType.numberWithOptions(
                                    decimal: false, signed: false),
                            onFieldChanged: (widget, telefone) {},
                            onValidation: (String? value) {
                              String patttern =
                                  r'^\([1-9]{2}\) 9[1-9]{1}[0-9]{3}\-[0-9]{4}$';
                              RegExp regExp = RegExp(patttern);
                              if (value!.isEmpty) {
                                return 'Campo obrigatório';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Digite um número válido';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Atualizando informações')),
                                );

                                Rider updatedRider = Rider(
                                    imagePath: widget.rider.imagePath,
                                    name: _name.text,
                                    email: widget.rider.email,
                                    telefone: _telefone.text,
                                    instituto: _instituto.text,
                                    curso: _curso.text,
                                    ano: int.parse(_ano.text),
                                    caronasMotorista:
                                        widget.rider.caronasMotorista,
                                    caronasPassageiro:
                                        widget.rider.caronasPassageiro,
                                    ranking: widget.rider.ranking,
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
