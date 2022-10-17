import 'dart:async';

import 'package:caronas_usp/app/modules/criar/bloc/criar_bloc.dart';
import 'package:caronas_usp/app/modules/criar/bloc/criar_event.dart';
import 'package:caronas_usp/app/modules/criar/bloc/criar_state.dart';
import 'package:caronas_usp/app/modules/oferecer/ui/oferecer_page.dart';
import 'package:caronas_usp/model/location.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/model/user.dart';
import 'package:caronas_usp/utils/maps_autocomplete.dart';
import 'package:caronas_usp/utils/maps_open_route_service.dart';
import 'package:caronas_usp/widget/appbar_backbutton_widget.dart';
import 'package:caronas_usp/widget/datetime_field_widget.dart';
import 'package:caronas_usp/widget/field_wrapper_widget.dart';
import 'package:caronas_usp/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:quantity_input/quantity_input.dart';

class CriarPage extends StatefulWidget {
  const CriarPage({Key? key}) : super(key: key);

  @override
  State<CriarPage> createState() => _CriarPageState();
}

class _CriarPageState extends State<CriarPage> {
  CriarBloc? _criarBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _startSearchFieldController =
      TextEditingController();
  final TextEditingController _endSearchFieldController =
      TextEditingController();
  final _priceController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: "R\$ ");

  late Feature startPosition;
  late Feature endPosition;

  late DateTime rideDay;
  late DateTime rideSourceDatetime;
  late DateTime rideDestinyDatetime;

  late double price;
  late int totalOccupation = 3;

  late Ride newRide;

  NetworkHelper openRouteSource = NetworkHelper(coordinates: [[]]);
  Future<Iterable<Feature?>> autoCompleteSearch(String value) async {
    if (value.isNotEmpty) {
      var result = await openRouteSource.getAutocomplete(value);
      return result.features;
    }

    return [];
  }

  @override
  void initState() {
    super.initState();

    _criarBloc = context.read<CriarBloc>();
    _criarBloc!.add(FetchCreating());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _handleListener(
      BuildContext context, CriarState state) async {
    if (state is Created) {
      // navigate to detalhes
      if (state.created == true) {
        Navigator.of(context).pop(MaterialPageRoute(
            builder: (context) => const OferecerPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CriarBloc, CriarState>(
      bloc: _criarBloc,
        listener: _handleListener,
      builder: (BuildContext context, CriarState state) {
        return Scaffold(
          appBar: buildAppBarBackButton(context, "Criar"),
          body: Form(
              key: _formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  FieldWrapper(
                    fieldInput: DatetimeFieldWidget(
                      type: "date",
                      label: "Dia da Carona",
                      onDateSelected: (DateTime value) {
                        rideDay = value;
                      },
                    ),
                  ),
                  FieldWrapper(
                    fieldInput: TypeAheadFormField<Feature?>(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: _startSearchFieldController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              labelText: "Origem",
                              suffixIcon:
                              _startSearchFieldController.text.isNotEmpty
                                  ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    _startSearchFieldController.clear();
                                  });
                                },
                                icon: const Icon(
                                    Icons.clear_outlined, color: Colors.green),
                              )
                                  : const Icon(Icons.place_outlined))),
                      debounceDuration: const Duration(milliseconds: 1000),
                      noItemsFoundBuilder: (context) {
                        return Container(
                          height: 36,
                          child: const Center(
                              child: Text(
                                "Local não encontrado",
                                style: TextStyle(fontSize: 16),
                              )),
                        );
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      hideSuggestionsOnKeyboardHide: false,
                      suggestionsCallback: (pattern) async {
                        return autoCompleteSearch(pattern);
                      },
                      itemBuilder: (context, Feature? suggestion) {
                        return ListTile(
                          leading: const CircleAvatar(
                            child: Icon(
                              Icons.pin_drop,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(suggestion!.properties!.label.toString()),
                        );
                      },
                      onSuggestionSelected: (Feature? suggestion) {
                        setState(() {
                          _startSearchFieldController.text =
                              suggestion!.properties!.label.toString();
                          startPosition = suggestion;
                        });
                      },
                    ),
                  ),
                  FieldWrapper(
                    fieldInput: DatetimeFieldWidget(
                      type: "hour",
                      label: "Horário de Saída",
                      onDateSelected: (DateTime value) {
                        rideSourceDatetime = value;
                      },
                    ),
                  ),
                  FieldWrapper(
                    fieldInput: TypeAheadFormField<Feature?>(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: _endSearchFieldController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              labelText: "Destino",
                              suffixIcon: _endSearchFieldController.text
                                  .isNotEmpty
                                  ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    _endSearchFieldController.clear();
                                  });
                                },
                                icon: const Icon(
                                    Icons.clear_outlined, color: Colors.green),
                              )
                                  : const Icon(Icons.place_outlined))),
                      debounceDuration: const Duration(milliseconds: 1000),
                      noItemsFoundBuilder: (context) {
                        return Container(
                          height: 36,
                          child: const Center(
                              child: Text(
                                "Local não encontrado",
                                style: TextStyle(fontSize: 16),
                              )),
                        );
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      hideSuggestionsOnKeyboardHide: false,
                      suggestionsCallback: (pattern) async {
                        return autoCompleteSearch(pattern);
                      },
                      itemBuilder: (context, Feature? suggestion) {
                        return ListTile(
                          leading: const CircleAvatar(
                            child: Icon(
                              Icons.pin_drop,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(suggestion!.properties!.label.toString()),
                        );
                      },
                      onSuggestionSelected: (Feature? suggestion) {
                        setState(() {
                          _endSearchFieldController.text =
                              suggestion!.properties!.label.toString();
                          endPosition = suggestion;
                        });
                      },
                    ),
                  ),
                  FieldWrapper(
                    fieldInput: DatetimeFieldWidget(
                      type: "hour",
                      label: "Horário de Chegada",
                      onDateSelected: (DateTime value) {
                        rideDestinyDatetime = value;
                      },
                    ),
                  ),
                  FieldWrapper(
                    fieldInput: TextFieldWidget(
                      label: "Preço",
                      fieldController: _priceController,
                      textInputType: const TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      onValidation: (value) {
                        if (value == null) {
                          return 'Campo obrigatório';
                        } else if (_priceController.numberValue == 0) {
                          return 'Não pode ser zero';
                        } else if (_priceController.numberValue < 0) {
                          return 'Não pode ser menor que zero';
                        }
                        price = _priceController.numberValue;
                        return null;
                      },
                    ),
                  ),
                  FieldWrapper(
                    fieldInput: Center(
                      child: QuantityInput(
                        label: "Quantidade de Lugares",
                        value: totalOccupation,
                        onChanged: (value) =>
                            setState(() =>
                            totalOccupation = int.parse(
                                value.replaceAll(',', ''))),
                        maxValue: 7,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Criando a carona')),
                          );
                          newRide = Ride(
                              rideId: "0",
                              driverUsers: const User(
                                imagePath:
                                "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
                                name: "João Souza",
                                email: "joao.souza@usp.br",
                                cpf: "000.000.000-00",
                                telefone: "(99) 99999-9999",
                                instituto: "FAU - Arquitetura",
                                veiculoModelo: "Ford Ka",
                                veiculoCor: "Prata",
                                veiculoMarca: "Ford",
                                veiculoPlaca: "ABC1D34",
                                caronasUtilizadas: 10,
                                caronasRealizadas: 0,
                                ranking: 4.9,
                              ),
                              rideDestinyDatetime: DateTime(rideDay.year,
                                  rideDay.month, rideDay.day,
                                  rideDestinyDatetime.hour,
                                  rideDestinyDatetime.minute).toString(),
                              destinyPlace: startPosition.properties!.label
                                  .toString(),
                              rideSourceDatetime: DateTime(rideDay.year,
                                  rideDay.month, rideDay.day,
                                  rideSourceDatetime.hour,
                                  rideSourceDatetime.minute).toString(),
                              sourcePlace: endPosition.properties!.label
                                  .toString(),
                              price: price,
                              totalOccupation: totalOccupation,
                              currentOccupation: 0,
                              consumersUsers: [],
                              locations: [
                                Location(
                                    id: "0",
                                    description: startPosition.properties!.label
                                        .toString(),
                                    lat: startPosition.geometry!
                                        .coordinates![1],
                                    lon: startPosition.geometry!.coordinates![0]
                                ),
                                Location(
                                    id: "1",
                                    description: endPosition.properties!.label
                                        .toString(),
                                    lat: endPosition.geometry!.coordinates![1],
                                    lon: endPosition.geometry!.coordinates![0]
                                )
                              ]
                          );

                          _criarBloc!.add(FetchCreate(newRide));
                        }
                      },
                      child: const Text("Criar")
                  ),
                  const SizedBox(height: 12),
                ],
              )),
        );
      }
    );
  }
}
