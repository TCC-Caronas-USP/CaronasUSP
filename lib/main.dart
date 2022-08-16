import 'package:flutter/material.dart';

import 'page/PegarCaronas.dart';
import 'page/SuasCaronas.dart';
import 'page/OferecerCaronas.dart';
import 'page/Perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        dividerColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
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

  final screens = [PegarCaronas(), SuasCaronas(), OferecerCaronas(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'navbar',
        theme: ThemeData(
          primaryColor: Colors.green
        ),
        home: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.green,
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
