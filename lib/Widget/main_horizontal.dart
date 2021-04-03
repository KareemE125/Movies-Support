import 'package:flutter/material.dart';
import 'package:movies_support/JSON%20Service/movies_json_service.dart';

import '../main.dart';

class Popular_Movies extends StatelessWidget {
  final String image;
  final String name;
  final List gneres;
  final int id;

   Popular_Movies( this.image, this.name,this.gneres,this.id) ;

  String Genres(){

    String ahmed='';
    for(String s in MovieJson.getGenresByIndex(id, jsonResponse) ){
      ahmed+=s.toString();
      if(s.toString() == MovieJson.getGenresByIndex(id, jsonResponse).last){ break; }
      ahmed+=', ';

    }
    return ahmed;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('det',
          arguments: id,
        );
      },

      child: Container(
        margin: EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width / 2.7,
        height: MediaQuery.of(context).size.height *0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //color: Colors.white,
        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
              image,
                fit: BoxFit.cover,
                height:  MediaQuery.of(context).size.height *0.24,
                width: MediaQuery.of(context).size.width / 2.7,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, fontFamily: 'Viga'),
                  ),
                  Text(
                    Genres(),
                    style: TextStyle(
                        color: Colors.white30, fontSize: 12, fontFamily: 'Viga'),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}


