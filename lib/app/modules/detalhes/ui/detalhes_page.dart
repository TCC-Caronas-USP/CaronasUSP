import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_bloc.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_event.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_state.dart';
import 'package:caronas_usp/app/modules/entrar/ui/entrar_page.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_bloc.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_event.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_bloc.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_event.dart';
import 'package:caronas_usp/app/widgets/appbar_backbutton_widget.dart';
import 'package:caronas_usp/app/modules/detalhes/ui/details_ride_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetalhesPage extends StatefulWidget {
  final int rideId;
  final AppPage page;

  const DetalhesPage({Key? key, required this.rideId, required this.page})
      : super(key: key);

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  DetalhesBloc? _detalhesBloc;
  HistoricoBloc? _historicoBloc;
  OferecerBloc? _oferecerBloc;

  bool _loading = true;
  late Ride ride;
  late Rider rider;

  @override
  void initState() {
    super.initState();

    _detalhesBloc = context.read<DetalhesBloc>();
    _detalhesBloc!.add(FetchRideDetails(widget.rideId));

    _historicoBloc = context.read<HistoricoBloc>();
    _oferecerBloc = context.read<OferecerBloc>();
  }

  Future<void> _handleListener(
      BuildContext context, DetalhesState state) async {
    if (state is RideDetailsLoading) {
      _loading = true;
    }
    if (state is RideDetails) {
      _loading = false;
      ride = state.ride;
      rider = state.rider;
    }
    if (state is Canceled) {
      _loading = false;
      if (state.canceled == true) {
        await Future.delayed(const Duration(seconds: 2), () {});
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        _oferecerBloc!.add(FetchUserOfferedRides());
      } else {
        Navigator.pop(context, "não cancelada");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red.withOpacity(0.75),
              content: const ListTile(
                title: Text("Atenção", style: TextStyle(color: Colors.white)),
                subtitle: Text(
                    "Não foi possível cancelar na carona. Tente novamente mais tarde.",
                    style: TextStyle(color: Colors.white)),
              )),
        );
      }
    }
    if (state is Exited) {
      _loading = false;
      if (state.canceled == true) {
        await Future.delayed(const Duration(seconds: 2), () {});
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        _historicoBloc!.add(FetchHistorico());
      }
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
                : DetailsRideWidget(ride: ride, page: widget.page),
            floatingActionButton: buildFloatingActionButton(widget.page),
          );
        },
        listener: _handleListener);
  }

  Widget? buildFloatingActionButton(page) {
    switch (page) {
      case AppPage.oferecer:
        return FloatingActionButton(
            heroTag: "btnCancel",
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text("Deseja realmente cancelar a carona?",
                          textAlign: TextAlign.center),
                      content: const Text(
                          "Caso cancele os caronistas serão alertados.",
                          textAlign: TextAlign.center),
                      alignment: Alignment.center,
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Não'),
                          child: const Text('Não'),
                        ),
                        TextButton(
                          onPressed: () {
                            _detalhesBloc!.add(CancelRide(ride.id));
                          },
                          child: const Text('Sim',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    )),
            backgroundColor: Colors.red[400],
            child: const Icon(Icons.cancel));

      case AppPage.pegar:
        return FloatingActionButton(
            heroTag: "btnEntrar",
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Entrar(
                        ride: ride,
                        rider: rider,
                      )));
              _detalhesBloc!.add(FetchRideDetails(widget.rideId));
            },
            backgroundColor: Colors.green[400],
            child: const Icon(Icons.input));

      case AppPage.historico:
        return FloatingActionButton(
            heroTag: "btnSair",
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text("Deseja realmente sair da carona?",
                          textAlign: TextAlign.center),
                      alignment: Alignment.center,
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Não'),
                          child: const Text('Não'),
                        ),
                        TextButton(
                          onPressed: () {
                            _detalhesBloc!
                                .add(ExitRide(ride.getPassenger(rider)));
                          },
                          child: const Text('Sim',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    )),
            backgroundColor: Colors.red,
            child: const Icon(Icons.output));
    }
    return null;
  }
}
