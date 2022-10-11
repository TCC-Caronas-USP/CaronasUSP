import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_bloc.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_bloc.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_bloc.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_bloc.dart';
import 'package:caronas_usp/app/modules/pegar/bloc/pegar_bloc.dart';
import 'package:caronas_usp/app/modules/profile/bloc/profile_bloc.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:caronas_usp/app/repositories/rider_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(
            RiderRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => OferecerBloc(
            RidesRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => PegarBloc(
              RidesRepository()
          ),
        ),
        BlocProvider(
          create: (context) => HistoricoBloc(),
        ),
        BlocProvider(
          create: (context) => DetalhesBloc(
            RidesRepository(),
          ),
        ),
      ],
      child: App(),
    ),
  );
}

// import 'page/user_page_test.dart';

// @override
// Widget build(BuildContext context) => ChangeNotifierProvider(
//   create: (context) => GoogleSignInProvider(),
//   child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: title,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       // home: const MyHomePage(title: 'Flutter Demo Home Page'),
//       home: UserPage()
//   ),
// );