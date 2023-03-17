import 'package:flutter/material.dart';
import 'package:hello_world/screens/note_page.dart';
import 'package:hello_world/screens/favorites_page.dart';
import 'package:hello_world/screens/profile_page.dart';
import 'package:hello_world/screens/first_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String appBarTitle = '';

  static List<Widget> _widgetOptions = <Widget>[
    FirstPage(),
    FavoritesPage(),
    ProfilePage(),
    NotePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // title of the AppBar
    switch (index) {
      case 0:
        appBarTitle = 'Hello World';
        break;
      case 1:
        appBarTitle = 'Favorites';
        break;
      case 2:
        appBarTitle = 'Profile';
        break;
      case 3:
        appBarTitle = 'Note';
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: 'Note',
    ),
  ],
  currentIndex: _selectedIndex,
  selectedItemColor: Colors.deepPurple,
  unselectedItemColor: Colors.grey,
  onTap: _onItemTapped,
      ),
    );
  }
}
