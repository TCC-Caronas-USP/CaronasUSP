import 'package:caronas_usp/app/modules/login/ui/login_page.dart';
import 'package:caronas_usp/app/modules/pegar/ui/pegar_page.dart';
import 'package:caronas_usp/app/modules/historico/ui/historico_page.dart';
import 'package:caronas_usp/app/modules/oferecer/ui/oferecer_page.dart';
import 'package:caronas_usp/app/modules/profile/ui/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  Widget getPage() {
    return pages[_selectedIndex]();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && FirebaseAuth.instance.currentUser != null) {
                return getPage();
              } else {
                return const LoginPage();
              }
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.green[400],
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white38,
            iconSize: 25,
            showUnselectedLabels: false,
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
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
          ),
        ));
  }
}
