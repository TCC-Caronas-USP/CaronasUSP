import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_bloc.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_event.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_state.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_bloc.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/widgets/appbar_widget.dart';
import 'package:caronas_usp/app/widgets/rides_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  HistoricoBloc? _historicoBloc;

  late Rider rider;
  List<List<Ride>>? myRides;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _historicoBloc = context.read<HistoricoBloc>();
    _historicoBloc!.add(FetchHistorico());
  }

  Future<void> _handleListener(
      BuildContext context, HistoricoState state) async {
    if (state is HistoricoLoading) {
      _loading = true;
      myRides = null;
    }
    if (state is HistoricoLoaded) {
      myRides = state.myRides;
      rider = state.rider;
      _loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoricoBloc, HistoricoState>(
        bloc: _historicoBloc,
        listener: _handleListener,
        builder: (BuildContext context, HistoricoState state) {
          return Scaffold(
              appBar: buildAppBar(context, "Suas Caronas"),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {},
                backgroundColor: Colors.green[400],
                child: const Icon(Icons.refresh),
              ),
              body: _loading
                  ? const SpinKitRotatingCircle(
                      color: Colors.green,
                      size: 50.0,
                    )
                  : RidesListWidget(
                      ridesPerDate: myRides!,
                      page: AppPage.historico,
                      rider: rider,
                    ));
        });
  }
}
