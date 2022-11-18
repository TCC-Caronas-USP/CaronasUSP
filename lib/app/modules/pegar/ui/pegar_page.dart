import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_bloc.dart';
import 'package:caronas_usp/app/modules/pegar/bloc/pegar_bloc.dart';
import 'package:caronas_usp/app/modules/pegar/bloc/pegar_event.dart';
import 'package:caronas_usp/app/modules/pegar/bloc/pegar_state.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/model/rider.dart';
import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:caronas_usp/widget/rides_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PegarPage extends StatefulWidget {
  const PegarPage({Key? key}) : super(key: key);

  @override
  State<PegarPage> createState() => _PegarPageState();
}

class _PegarPageState extends State<PegarPage> {
  PegarBloc? _pegarBloc;
  DateTime date = DateTime.now();

  late Rider rider = context.read<LoginBloc>().currentRider!;
  List<List<Ride>>? offeredRides;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _pegarBloc = context.read<PegarBloc>();
    _pegarBloc!.add(FetchPegar());
  }

  Future<void> _handleListener(BuildContext context, PegarState state) async {
    if (state is PegarLoading) {
      _loading = true;
      offeredRides = null;
    }
    if (state is PegarLoaded) {
      offeredRides = state.offeredRides;
      _loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PegarBloc, PegarState>(
        bloc: _pegarBloc,
        listener: _handleListener,
        builder: (BuildContext context, PegarState state) {
          return Scaffold(
            appBar: buildAppBar(context, "Pegar Caronas"),
            // appBar: buildAppBar(context, "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}:${date.second} ${date.timeZoneName}"),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100));
                if (newDate == null) return;
                setState(() => date = newDate);
              },
              backgroundColor: Colors.green[400],
              child: const Icon(Icons.date_range), // filter_alt ou date_range
            ),
            body: _loading
                ? const SpinKitRotatingCircle(
                    color: Colors.green,
                    size: 50.0,
                  )
                : RidesListWidget(
                    ridesPerDate: offeredRides!,
                    rider: rider,
                    page: AppPage.pegar,
                  ),
          );
        });
  }
}
