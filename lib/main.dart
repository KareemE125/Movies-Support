import 'package:flutter/material.dart';
import 'package:movies_support/Login%20-%20Regestretion/Satrt.dart';
import 'package:movies_support/Screen/favorite.dart';
import 'package:movies_support/Screen/film_details.dart';
import 'package:movies_support/Screen/main_page.dart';
import 'package:movies_support/Screen/see_all.dart';
import 'IntroductionScreen.dart';
import 'JSON Service/movies_json_service.dart';
import 'Login - Regestretion/Login.dart';
import 'Login - Regestretion/Regester.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(  Movie_App());
}
//Navigator.pushReplacementNamed(context, 'login')
var jsonResponse;

class Movie_App extends StatefulWidget {
  @override
  _Movie_AppState createState() => _Movie_AppState();
  void ah(){print('ahmed');}
}

class _Movie_AppState extends State<Movie_App> {

  void assignJsonResponse()async{
    jsonResponse= await MovieJson.parseJson();
  }

  @override
  void initState() {
    assignJsonResponse();
    super.initState();
  }

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
        'Intro' : (context)=>intro(),
        'fav' : (context)=>Favorite(),
        'det' : (context)=>Film_Details(),
        'see' : (context)=>See_All(),
      },
      home:Main_Page(),

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
        image: AssetImage('assets/images/mov/splach.jpg'),
        fit: BoxFit.cover,
      ),


    ),
  );
}




