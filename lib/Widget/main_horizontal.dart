import 'package:flutter/material.dart';

class Popular_Movies extends StatelessWidget {
  final String image;
  final String name;

   Popular_Movies( this.image, this.name) ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('det',arguments:
        name,
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
              child: Image.asset(
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
                    'action,drama,fantasy',
                    style: TextStyle(
                        color: Colors.white30, fontSize: 10, fontFamily: 'Viga'),
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
