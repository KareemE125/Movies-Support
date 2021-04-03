import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_support/JSON%20Service/movies_json_service.dart';
import 'package:movies_support/Widget/show.dart';
import '../Screen/main_page.dart';
import '../main.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text('My Favorite Movies',style: TextStyle(fontFamily: 'Viga',fontSize: 25),),
        centerTitle: true,

      ),
      body: Fav.length!=0?ListView.builder(
        itemBuilder: (ctx,index){
          return Show(MovieJson.getPosterByIndex(Fav[index], jsonResponse), MovieJson.getNameByIndex(Fav[index], jsonResponse), Fav[index], double.parse(MovieJson.getRatingByIndex(Fav[index], jsonResponse)),MovieJson.getGenresByIndex(Fav[index], jsonResponse),-1);
        },
        itemCount: Fav.length,


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
