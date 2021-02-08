import 'package:flutter/material.dart';
import 'package:movies_support/Login%20-%20Regestretion/test.dart';
import 'IntroductionScreen.dart';
import 'Login - Regestretion/Login.dart';
import 'Login - Regestretion/Regester.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(  Movie_App());
}
//Navigator.pushReplacementNamed(context, 'login')

class Movie_App extends StatefulWidget {
  @override
  _Movie_AppState createState() => _Movie_AppState();
  void ah(){print('ahmed');}
}

class _Movie_AppState extends State<Movie_App> {

  Widget build(BuildContext context) {

    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Color(0xFF7D36FE),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.black45,
            ),
          ),
        ),
      ),
      routes: {
        'login': (context)=>login(),
        'register': (context)=>Register(),
        'Intro' : (context)=>intro()

      },
      home:login(),

    );
  }
}


Container Splach_Screen(BuildContext context)
{
  return Container(
    height: 300,
    width: 600,
      decoration: BoxDecoration(
      color: Colors.white70,
      image: DecorationImage(
      image: AssetImage('images/mov/splach.jpg'),
      fit: BoxFit.cover,

     ),


  ),
  );
}




