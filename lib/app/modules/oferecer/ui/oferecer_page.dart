import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_bloc.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_event.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_state.dart';
import 'package:caronas_usp/model/auth_user.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/model/user.dart';
import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:caronas_usp/widget/offer_ride_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class OferecerPage extends StatefulWidget {
  const OferecerPage({Key? key}) : super(key: key);

  @override
  State<OferecerPage> createState() => _OferecerPageState();
}

class _OferecerPageState extends State<OferecerPage> {
  OferecerBloc? _oferecerBloc;

  // TODO precisa para ter o usuário?
  AuthUser? authUser = AuthUser(
      imagePath:
          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
      name: "João Souza",
      email: "joao.souza@usp.br");

  User? user;
  List<List<Ride>>? userOfferedRides;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _oferecerBloc = context.read<OferecerBloc>();
    _oferecerBloc!.add(FetchUserOfferedRides());
  }

  Future<void> _handleListener(
      BuildContext context, OferecerState state) async {
    if (state is OferecerLoading) {
      _loading = true;
      userOfferedRides = null;
    }
    if (state is OferecerLoaded) {
      userOfferedRides = state.userOfferedRides;
      _loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OferecerBloc, OferecerState>(
        bloc: _oferecerBloc,
        listener: _handleListener,
        builder: (BuildContext context, OferecerState state) {
          return Scaffold(
              appBar: buildAppBar(context, "Oferecer Caronas"),
              body: _loading
                  ? const SpinKitRotatingCircle(
                      color: Colors.green,
                      size: 50.0,
                    )
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                          const SizedBox(
                            height: 24,
                          ),
                          OfferRide(userOfferedRides: userOfferedRides!),
                          const SizedBox(
                            height: 24,
                          ),
                        ]
              )
          );
        });
  }
}
