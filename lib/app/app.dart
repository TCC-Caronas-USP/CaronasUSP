import 'package:caronas_usp/app/modules/login/bloc/login_bloc.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_state.dart';
import 'package:caronas_usp/app/modules/login/ui/login_page.dart';
import 'package:caronas_usp/app/modules/pegar/ui/pegar_page.dart';
import 'package:caronas_usp/app/modules/historico/ui/historico_page.dart';
import 'package:caronas_usp/app/modules/oferecer/ui/oferecer_page.dart';
import 'package:caronas_usp/app/modules/profile/ui/profile_page.dart';
import 'package:caronas_usp/app/repositories/network/onesignal_requester.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  final pages = [
    () => PegarPage(),
    () => HistoricoPage(), //TODO voltar para historico
    () => OferecerPage(),
    () => ProfilePage()
  ];

  Widget getIndexedPage() {
    return pages[_selectedIndex]();
  }

  void navigationTapped(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }

  set selectedIndex(int index) => _selectedIndex;

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.green[400],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      iconSize: 25,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: navigationTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up_rounded),
          label: 'Pegar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_rounded),
          label: 'Caronas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car_filled),
          label: 'Oferecer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Perfil',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Caronas USP',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<LoginBloc, LoginState>(
          builder: (BuildContext context, LoginState state) {
            if (state is LoggedIn) {
              var currentRider = state.rider;
              String riderEmail = currentRider.email;
              OneSignalRequester.subscribe(riderEmail);
              return Scaffold(
                body: getIndexedPage(),
                bottomNavigationBar: getBottomNavigationBar(),
              );
            } else {
              return const LoginPage();
            }
          },
        ));
  }
}
