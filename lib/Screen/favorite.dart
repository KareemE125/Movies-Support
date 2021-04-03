import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_support/Widget/show.dart';
import '../Screen/main_page.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text('My Favorite Movies',style: TextStyle(fontFamily: 'Viga',fontSize: 25),),
        centerTitle: true,

      ),
      body: Fav.length!=0?ListView(
        children: [
          SizedBox(height: 10,),
          ...Fav.map((e){
            //return Show(e['image'], e['name'],-1);
          }).toList(),
        ],

      ):Center(
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No Movies Added',style: TextStyle(fontFamily: 'Viga',fontSize: 35,color: Colors.black),),
            SizedBox(width: 15,),
            Icon(FontAwesomeIcons.handHoldingHeart,color: Colors.red,),
          ],
        ),

      ),
    );
  }
}
