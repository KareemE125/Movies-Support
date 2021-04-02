import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Startt extends StatefulWidget {
  @override
  _StarttState createState() => _StarttState();
}

class _StarttState extends State<Startt> {
  bool header1=false;
  bool header2=false;
  bool header3=false;
  bool down=false;
  double val1=0.8;
  String image='assets/images/mov/cover2.jpg';

  @override
  void initState()
  {
    super.initState();
    print('dsgsdg');
     Timer(Duration(seconds:8), ()=>Navigator.pushReplacementNamed(context, 'Intro'));
    Timer(Duration(seconds:2), (){setState(() {
     down=true;
     val1=0.75;
     //image=;
    });});
    Timer(Duration(seconds:4), (){setState(() {
      header1=true;
      val1=0.7;
    });});
    Timer(Duration(seconds:5), (){setState(() {
      header2=true;
      val1=0.65;
    });});
    Timer(Duration(seconds:6), (){setState(() {
      header3=true;
      val1=0.60;
    });});


  }
  Color mycolour=Colors.black87;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF12172D),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white70,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(val1), BlendMode.darken),
            ),
          ),
           child: Column(
             children: [
               SizedBox(height: MediaQuery.of(context).size.height*0.2,),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.baseline,
                 textBaseline: TextBaseline.alphabetic,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     'MOVIES',
                     style: TextStyle(
                         fontSize: 50.0,
                         color: header1==true? Colors.white:Colors.white.withOpacity(0.0),
                         fontFamily: 'Pacifico',
                         fontWeight: FontWeight.w900
                     ),
                   ),
                   SizedBox(width: 8.0,),
                   Icon(FontAwesomeIcons.video, color: header2==true? Colors.white.withOpacity(0.7):Colors.white.withOpacity(0.0),size: 30.0,),
                   SizedBox(width: 8.0,),
                   Text(
                     'APP',
                     style: TextStyle(
                         fontSize: 25,
                         color: header3==true? Colors.white:Colors.white.withOpacity(0.0),
                         fontFamily: 'Pacifico',
                         fontWeight: FontWeight.w900
                     ),
                   ),
                 ],
               ),
               down==true? Column(
                 children: [
                   SizedBox(height: MediaQuery.of(context).size.height*0.45,),
                   CircularProgressIndicator(backgroundColor: Colors.white,strokeWidth: 4.0,semanticsLabel: 'SAFASF',),
                   SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                   Text(
                     'Online Movies App',
                     style: TextStyle(
                       fontSize: 20,
                       color: Colors.white,
                       fontFamily: 'Viga',

                     ),
                   ),
                   Text(
                     'For Every One',
                     style: TextStyle(
                       fontSize: 20,
                       color: Colors.white,
                       fontFamily: 'Viga',

                     ),
                   ),

                 ],
               ):SizedBox(),


             ],
           ),
        ),
      ),
    );
  }
}
Container co(BuildContext context)
{
  return Container(
    margin: EdgeInsets.all(10.0),
    height: MediaQuery.of(context).size.height/2,
    child: Wrap(
      children: [
        Container(
          height: 200,
          width: 100,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white70,
            image: DecorationImage(
              image: AssetImage('assets/images/mov/jocker.jpg'),
              fit: BoxFit.cover,

            ),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white70,
            image: DecorationImage(
              image: AssetImage('assets/images/mov/kingKong.jpg'),
              fit: BoxFit.cover,

            ),
          ),
        ),

      ],
    ),

  );
}
