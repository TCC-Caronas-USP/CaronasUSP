import 'package:caronas_usp/app/modules/pegar/ui/pegar_page.dart';
import 'package:caronas_usp/app/modules/historico/ui/historico_page.dart';
import 'package:caronas_usp/app/modules/oferecer/ui/oferecer_page.dart';
import 'package:caronas_usp/app/modules/profile/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  final pages = [
    () => PegarPage(),
    () => HistoricoPage(),
    () => OferecerPage(),
    () => ProfilePage()
  ];

  Widget getPage() {
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => pages[_selectedIndex]()));
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
          body: getPage(),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final screens = const [
    PegarPage(),
    HistoricoPage(),
    OferecerPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
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
    );
  }
}
