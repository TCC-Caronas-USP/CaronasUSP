import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_bloc.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_event.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_state.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/model/rider.dart';
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

  Rider? user;
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
                  : OfferRide(userOfferedRides: userOfferedRides!),
          );
        });
  }
}
