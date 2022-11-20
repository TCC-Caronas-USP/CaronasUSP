import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/models/passenger.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/modules/aceitar/bloc/aceitar_bloc.dart';
import 'package:caronas_usp/app/modules/aceitar/bloc/aceitar_event.dart';
import 'package:caronas_usp/app/modules/aceitar/bloc/aceitar_state.dart';
import 'package:caronas_usp/app/modules/detalhes/ui/detalhes_page.dart';
import 'package:caronas_usp/app/widgets/appbar_backbutton_widget.dart';
import 'package:caronas_usp/app/widgets/info_details_widget.dart';
import 'package:caronas_usp/app/widgets/maps_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AceitarPage extends StatefulWidget {
  final Ride ride;
  final Passenger passenger;

  AceitarPage({Key? key, required this.ride, required this.passenger})
      : super(key: key);

  @override
  State<AceitarPage> createState() => _AceitarPageState();
}

class _AceitarPageState extends State<AceitarPage> {
  AceitarBloc? _aceitarBloc;

  @override
  void initState() {
    super.initState();

    _aceitarBloc = context.read<AceitarBloc>();
  }

  Future<void> _handleListener(
      BuildContext context, AceitarState state) async {
    if (state is PassengerValidated) {
      Navigator.of(context)
          .pop(MaterialPageRoute(builder: (context) => DetalhesPage(ride: widget.ride, page: AppPage.oferecer)));
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AceitarBloc, AceitarState>(
        bloc: _aceitarBloc,
        listener: _handleListener,
        builder: (BuildContext context, AceitarState state) {
          return Scaffold(
              appBar: buildAppBarBackButton(context, "Aceitar Caronista"),
              body: ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    InfoDetailsWidget(
                        widget.passenger.riderName,
                        widget.passenger.riderInstituto,
                        context,
                        widget.ride,
                        AppPage.aceitar,
                        InfoDetails.passenger,
                        imagePath: widget.passenger.riderImagePath,
                        passenger: widget.passenger),
                    InfoDetailsWidget(widget.passenger.meetingPoint.description,
                        "Ponto de encontro", context, widget.ride, AppPage.aceitar,
                        InfoDetails.location, time: ""),
                    Maps(
                        height: 400,
                        locations: widget.ride
                            .getLocationsWithNewSuggestion(widget.passenger)),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ElevatedButton(
                          onPressed: () {
                            _aceitarBloc!.add(PassengerAccepted(widget.passenger));
                          },
                          child: Text("Aceitar")),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ElevatedButton(
                          onPressed: () {
                            _aceitarBloc!.add(PassengerRejected(widget.passenger));
                          },
                          child: Text("Rejeitar"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                          )),
                    ),
                  ]));
        },
    );
  }
}