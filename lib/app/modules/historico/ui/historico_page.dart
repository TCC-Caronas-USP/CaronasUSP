import 'package:caronas_usp/app/modules/historico/bloc/historico_bloc.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_event.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_state.dart';
import 'package:caronas_usp/model/auth_user.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/model/user.dart';
import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:caronas_usp/widget/offer_ride_widget.dart';
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

  // TODO precisa para ter o usuário?
  AuthUser? authUser = const AuthUser(
      imagePath:
          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
      name: "João Souza",
      email: "joao.souza@usp.br");

  User? user;
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
                  : OfferRide(userOfferedRides: myRides!));
        });
  }
}
