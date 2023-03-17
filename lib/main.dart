import 'package:flutter/material.dart';
import 'package:hello_world/screens/home_page.dart';
import 'package:hello_world/screens/splash.dart';
import 'package:hello_world/screens/favorites_page.dart';
import 'package:hello_world/screens/profile_page.dart';
import 'package:hello_world/screens/note_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/profile_page':(context) => ProfilePage(),
        '/favorites_page':(context) => FavoritesPage(),
        '/note_page':(context) => NotePage(),
      },
    );
  }
}
