import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_bloc.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_event.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_state.dart';
import 'package:caronas_usp/app/modules/entrar/ui/entrar_page.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/widget/appbar_backbutton_widget.dart';
import 'package:caronas_usp/widget/details_ride_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetalhesPage extends StatefulWidget {
  final Ride ride;
  final AppPage page;

  const DetalhesPage({Key? key, required this.ride, required this.page})
      : super(key: key);

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  DetalhesBloc? _detalhesBloc;

  Ride? ride;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _detalhesBloc = context.read<DetalhesBloc>();
    _detalhesBloc!.add(FetchRide(widget.ride));
  }

  Future<void> _handleListener(
      BuildContext context, DetalhesState state) async {
    if (state is DetalhesLoading) {
      _loading = true;
      ride = null;
    }
    if (state is DetalhesLoaded) {
      ride = state.ride;
      _loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetalhesBloc, DetalhesState>(
        bloc: _detalhesBloc,
        builder: (BuildContext context, DetalhesState state) {
          return Scaffold(
            appBar: buildAppBarBackButton(context, "Detalhes da Carona"),
            body: _loading
                ? const SpinKitRotatingCircle(
                    color: Colors.green,
                    size: 50.0,
                  )
                : DetailsRide(
                    ride: ride!,
                  ),
            floatingActionButton: _loading
                ? null
                : buildFloatingActionButton(widget.page),
          );
        },
        listener: _handleListener);
  }

  Widget? buildFloatingActionButton(page) {
    switch (page) {
      case AppPage.oferecer:
        return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                  heroTag: "btnCancel",
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          AlertDialog(
                            title: const Text(
                                "Deseja realmente cancelar a carona?",
                                textAlign: TextAlign.center),
                            content: const Text(
                                "Caso cancele os caronistas serão alertados.",
                                textAlign: TextAlign.center),
                            alignment: Alignment.center,
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Não'),
                                child: const Text('Não'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const OferecerPage()));
                                },
                                child: const Text('Sim',
                                    style: TextStyle(
                                        color: Colors.red)),
                              ),
                            ],
                          )),
                  backgroundColor: Colors.red[400],
                  child: const Icon(Icons.cancel)),
              const SizedBox(height: 6),
              FloatingActionButton(
                  heroTag: "btnEdit",
                  onPressed: () {},
                  backgroundColor: Colors.green[400],
                  child: const Icon(Icons.edit)),
            ]);

      case AppPage.pegar:
        return FloatingActionButton(
            heroTag: "btnEntrar",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Entrar(ride: widget.ride)));
            },
            backgroundColor: Colors.green[400],
            child: const Icon(Icons.input));

      case AppPage.historico:
        return FloatingActionButton(
            heroTag: "btnSair",
            onPressed: () {},
            backgroundColor: Colors.green[400],
            child: const Icon(Icons.output));
    }
    return null;
  }
}
