import 'package:caronas_usp/app/modules/entrar/bloc/entrar_bloc.dart';
import 'package:caronas_usp/app/modules/entrar/bloc/entrar_event.dart';
import 'package:caronas_usp/app/modules/entrar/bloc/entrar_state.dart';
import 'package:caronas_usp/app/models/location.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/utils/maps_autocomplete.dart';
import 'package:caronas_usp/app/utils/maps_open_route_service.dart';
import 'package:caronas_usp/app/widgets/appbar_backbutton_widget.dart';
import 'package:caronas_usp/app/widgets/field_wrapper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Entrar extends StatefulWidget {
  Ride ride;

  Entrar({Key? key, required this.ride}) : super(key: key);

  @override
  State<Entrar> createState() => _EntrarState();
}

class _EntrarState extends State<Entrar> {
  EntrarBloc? _entrarBloc;

  late Ride ride;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _localToMeet = TextEditingController();

  late Feature localToMeetPosition;

  List<Location> newLocations = [];

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

    _entrarBloc = context.read<EntrarBloc>();

    ride = widget.ride;
  }

  Future<void> _handleListener(BuildContext context, EntrarState state) async {
    if (state is Suggested) {
      if (state.sugested == true) {
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red.withOpacity(0.75),
              content: const ListTile(
                title: Text("Atenção", style: TextStyle(color: Colors.white)),
                subtitle: Text(
                    "Não foi possível entrar na carona. Verifique se já não entrou nessa carona, caso não tente novamente mais tarde.",
                    style: TextStyle(color: Colors.white)),
              )),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: _entrarBloc,
        listener: _handleListener,
        builder: (BuildContext context, EntrarState state) {
          return Scaffold(
              appBar: buildAppBarBackButton(context, "Entrar"),
              body: Form(
                  key: _formKey,
                  child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        FieldWrapper(
                          fieldInput: TypeAheadFormField<Feature?>(
                            textFieldConfiguration: TextFieldConfiguration(
                                controller: _localToMeet,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: const UnderlineInputBorder(),
                                    labelText: "Ponto de encontro",
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
                                                      "Coloque pontos de referência e não especifique o endereço com a numeração.",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                )),
                                          );
                                        },
                                        icon:
                                            const Icon(Icons.place_outlined)))),
                            debounceDuration:
                                const Duration(milliseconds: 1000),
                            keepSuggestionsOnLoading: false,
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
                                _localToMeet.text =
                                    suggestion!.properties!.label.toString();
                                localToMeetPosition = suggestion;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Entrando na carona')),
                                );

                                Location newLocation = Location(
                                    description: _localToMeet.text,
                                    lat: localToMeetPosition
                                        .geometry!.coordinates!.last,
                                    lon: localToMeetPosition
                                        .geometry!.coordinates!.first);

                                _entrarBloc!
                                    .add(SuggestPlace(ride, newLocation));
                              }
                            },
                            child: const Text("Entrar")),
                        const SizedBox(height: 12),
                      ])));
        });
  }
}
