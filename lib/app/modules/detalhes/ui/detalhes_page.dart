import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_bloc.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_event.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_state.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/widget/appbar_backbutton_widget.dart';
import 'package:caronas_usp/widget/details_ride_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';


class DetalhesPage extends StatefulWidget {
  final String rideId;

  const DetalhesPage({Key? key, required this.rideId}) : super(key: key);

  @override
  State<DetalhesPage> createState() => _DetalhesPageState(rideId: rideId);
}

class _DetalhesPageState extends State<DetalhesPage> {
  DetalhesBloc? _detalhesBloc;
  final String rideId;

  Ride? ride;
  bool _loading = true;

  _DetalhesPageState({required this.rideId});

  @override
  void initState() {
    super.initState();

    _detalhesBloc = context.read<DetalhesBloc>();
    _detalhesBloc!.add(FetchRide(rideId));
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
                : DetailsRide(ride: ride!,),
          );
        },
        listener: _handleListener);
  }
}
