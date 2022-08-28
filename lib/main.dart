import 'package:caronas_usp/app/modules/profile/bloc/profile_bloc.dart';
import 'package:caronas_usp/app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(
            UserRepository(),
          ),
        )
      ],
      child: App(),
    ),
  );
}
