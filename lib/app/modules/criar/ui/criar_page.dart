import 'dart:async';

import 'package:caronas_usp/app/modules/criar/bloc/criar_bloc.dart';
import 'package:caronas_usp/app/modules/criar/bloc/criar_event.dart';
import 'package:caronas_usp/app/modules/criar/bloc/criar_state.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_bloc.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_event.dart';
import 'package:caronas_usp/app/modules/oferecer/ui/oferecer_page.dart';
import 'package:caronas_usp/app/models/location.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/utils/maps_autocomplete.dart';
import 'package:caronas_usp/app/utils/maps_open_route_service.dart';
import 'package:caronas_usp/app/widgets/appbar_backbutton_widget.dart';
import 'package:caronas_usp/app/widgets/datetime_field_widget.dart';
import 'package:caronas_usp/app/widgets/field_wrapper_widget.dart';
import 'package:caronas_usp/app/widgets/text_field_widget.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:quantity_input/quantity_input.dart';

class CriarPage extends StatefulWidget {
  const CriarPage({Key? key}) : super(key: key);

  @override
  State<CriarPage> createState() => _CriarPageState();
}

class _CriarPageState extends State<CriarPage> {
  CriarBloc? _criarBloc;
  OferecerBloc? _oferecerBloc;

  bool _loading = true;

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

  late Rider driver;

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
    _oferecerBloc = context.read<OferecerBloc>();
    _criarBloc!.add(FetchCreating());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _handleListener(BuildContext context, CriarState state) async {
    if (state is CreateLoading) {
      _loading = true;
    }
    if (state is Creating) {
      _loading = false;
      driver = state.rider;
    }
    if (state is Created) {
      _loading = false;
      if (state.created == true) {
        Navigator.of(context)
            .pop(MaterialPageRoute(builder: (context) => const OferecerPage()));
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
                        FieldWrapper(
                          fieldInput: DatetimeFieldWidget(
                            type: DateTimeFieldPickerMode.date,
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
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                backgroundColor: Colors.black
                                                    .withOpacity(0.75),
                                                content: const ListTile(
                                                  title: Text("Atenção",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  subtitle: Text(
                                                      "Ao criar a carona tente colocar pontos de referência e não especifique o endereço com a numeração.",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                )),
                                          );
                                        },
                                        icon:
                                            const Icon(Icons.place_outlined)))),
                            debounceDuration:
                                const Duration(milliseconds: 1000),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                title: Text(
                                    suggestion!.properties!.label.toString()),
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
                            type: DateTimeFieldPickerMode.time,
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
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                backgroundColor: Colors.black
                                                    .withOpacity(0.75),
                                                content: const ListTile(
                                                  title: Text("Atenção",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  subtitle: Text(
                                                      "Ao criar a carona tente colocar pontos de referência e não especifique o endereço com a numeração.",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                )),
                                          );
                                        },
                                        icon:
                                            const Icon(Icons.place_outlined)))),
                            debounceDuration:
                                const Duration(milliseconds: 1000),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                title: Text(
                                    suggestion!.properties!.label.toString()),
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
                            type: DateTimeFieldPickerMode.time,
                            label: "Horário de Chegada",
                            onDateSelected: (DateTime value) {
                              rideDestinyDatetime = value;
                            },
                          ),
                        ),
                        TextFieldWidget(
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
                        FieldWrapper(
                          fieldInput: Center(
                            child: QuantityInput(
                              label: "Quantidade de Lugares",
                              value: totalOccupation,
                              readOnly: true,
                              onChanged: (value) {
                                setState(() => totalOccupation =
                                    int.parse(value.replaceAll(',', '')));
                              },
                              maxValue: 7,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                            "Por favor, tenha atenção às informações fornecidas, porque a carona não poderá ser editada depois de criada.",
                            overflow: TextOverflow.fade,
                            style: TextStyle(fontSize: 12)),
                        const SizedBox(height: 12),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Criando a carona')),
                                );
                                newRide = Ride(
                                  id: 0,
                                  driver: driver,
                                  endTime: DateTime(
                                      rideDay.year,
                                      rideDay.month,
                                      rideDay.day,
                                      rideDestinyDatetime.hour,
                                      rideDestinyDatetime.minute),
                                  endingPoint: Location(
                                      address: endPosition.properties!.label
                                          .toString(),
                                      lat:
                                          endPosition.geometry!.coordinates![1],
                                      lon: endPosition
                                          .geometry!.coordinates![0]),
                                  startTime: DateTime(
                                      rideDay.year,
                                      rideDay.month,
                                      rideDay.day,
                                      rideSourceDatetime.hour,
                                      rideSourceDatetime.minute),
                                  startingPoint: Location(
                                      address: startPosition
                                          .properties!.label
                                          .toString(),
                                      lat: startPosition
                                          .geometry!.coordinates![1],
                                      lon: startPosition
                                          .geometry!.coordinates![0]),
                                  price: price,
                                  maxPassengers: totalOccupation,
                                  riders: [],
                                );

                                _criarBloc!.add(FetchCreate(newRide));
                                _oferecerBloc!.add(FetchUserOfferedRides());
                              }
                            },
                            child: const Text("Criar")),
                        const SizedBox(height: 12),
                      ],
                    )),
          );
        });
  }
}
