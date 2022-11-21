import 'package:caronas_usp/app/modules/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:caronas_usp/app/modules/edit_profile/bloc/edit_profile_event.dart';
import 'package:caronas_usp/app/modules/edit_profile/bloc/edit_profile_state.dart';
import 'package:caronas_usp/app/modules/profile/ui/profile_page.dart';
import 'package:caronas_usp/app/models/vehicle.dart';
import 'package:caronas_usp/app/widgets/appbar_backbutton_widget.dart';
import 'package:caronas_usp/app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditVehicle extends StatefulWidget {
  Vehicle? vehicle;

  EditVehicle({Key? key, required this.vehicle}) : super(key: key);

  @override
  State<EditVehicle> createState() => _EditVehicleState();
}

class _EditVehicleState extends State<EditVehicle> {
  EditProfileBloc? _editBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _model = TextEditingController();
  final TextEditingController _brand = TextEditingController();
  final TextEditingController _color = TextEditingController();
  final TextEditingController _licensePlate = TextEditingController();

  @override
  void initState() {
    super.initState();

    _editBloc = context.read<EditProfileBloc>();

    _model.text = widget.vehicle != null ? widget.vehicle!.model : "";
    _brand.text = widget.vehicle != null ? widget.vehicle!.brand : "";
    _color.text = widget.vehicle != null ? widget.vehicle!.color : "";
    _licensePlate.text = widget.vehicle != null ? widget.vehicle!.licensePlate : "";
  }

  Future<void> _handleListener(
      BuildContext context, EditProfileState state) async {
    if (state is EditedVehicle) {
      if (state.updated == true) {
        Navigator.of(context).pop(MaterialPageRoute(
            builder: (context) =>
                const ProfilePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red.withOpacity(0.75),
              content: const ListTile(
                title: Text("Atenção", style: TextStyle(color: Colors.white)),
                subtitle: Text(
                    "Não foi possível editar o veículo. Tente novamente mais tarde.",
                    style: TextStyle(color: Colors.white)),
              )),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: _editBloc,
        listener: _handleListener,
        builder: (BuildContext context, EditProfileState state) {
          return Scaffold(
              appBar: buildAppBarBackButton(context, "Entrar"),
              body: Form(
                  key: _formKey,
                  child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        TextFieldWidget(
                          label: "Modelo",
                          fieldController: _model,
                          suffixIcon: const Icon(Icons.directions_car_filled),
                          onValidation: (String? value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
                        ),
                        TextFieldWidget(
                          label: "Marca",
                          fieldController: _brand,
                          suffixIcon: const Icon(Icons.directions_car_filled),
                          onValidation: (String? value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
                        ),
                        TextFieldWidget(
                          label: "Cor",
                          fieldController: _color,
                          suffixIcon: const Icon(Icons.color_lens),
                          onValidation: (String? value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
                        ),
                        TextFieldWidget(
                          label: "Placa",
                          fieldController: _licensePlate,
                          suffixIcon: const Icon(Icons.badge),
                          onValidation: (String? value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: widget.vehicle == null
                                          ? const Text('Adicionando carro')
                                          : const Text('Alterando carro')),
                                );

                                Vehicle newVehicle = Vehicle(
                                    model: _model.text,
                                    color: _color.text,
                                    brand: _brand.text,
                                    licensePlate: _licensePlate.text);

                                widget.vehicle == null
                                    ? _editBloc!
                                        .add(InsertVehicleInfo(newVehicle))
                                    : _editBloc!
                                        .add(UpdateVehicleInfo(newVehicle));
                              }
                            },
                            child: widget.vehicle == null
                                ? const Text("Adicionar")
                                : const Text("Alterar")),
                        const SizedBox(height: 12),
                      ])));
        });
  }
}
