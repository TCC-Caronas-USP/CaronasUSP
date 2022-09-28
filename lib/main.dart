import 'package:caronas_usp/app/modules/historico/bloc/historico_bloc.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_bloc.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_bloc.dart';
import 'package:caronas_usp/app/modules/pegar/bloc/pegar_bloc.dart';
import 'package:caronas_usp/app/modules/profile/bloc/profile_bloc.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:caronas_usp/app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(providers: [
      BlocProvider(
        create: (context) => ProfileBloc(UserRepository()),
      ),
      BlocProvider(
        create: (context) => LoginBloc(),
      ),
      BlocProvider(
        create: (context) => OferecerBloc(RidesRepository()),
      ),
      BlocProvider(
        create: (context) => PegarBloc(RidesRepository()),
      ),
      BlocProvider(
        create: (context) => HistoricoBloc(),
      ),
    ], child: App()),
  );
}
