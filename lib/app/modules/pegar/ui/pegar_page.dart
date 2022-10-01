import 'package:caronas_usp/app/modules/pegar/bloc/pegar_bloc.dart';
import 'package:caronas_usp/app/modules/pegar/bloc/pegar_event.dart';
import 'package:caronas_usp/app/modules/pegar/bloc/pegar_state.dart';
import 'package:caronas_usp/model/auth_user.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/model/user.dart';
import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:caronas_usp/widget/offer_ride_widget.dart';
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

  // TODO precisa para ter o usuário?
  AuthUser? authUser = const AuthUser(
      imagePath:
          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
      name: "João Souza",
      email: "joao.souza@usp.br");
  User? user;
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
                : OfferRide(userOfferedRides: offeredRides!),
          );
        });
  }
}
