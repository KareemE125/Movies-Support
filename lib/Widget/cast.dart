import 'package:flutter/material.dart';
import 'package:movies_support/Screen/main_page.dart';

class TheCast extends StatelessWidget {
  final String image;
  final String name;
  TheCast(this.image,this.name);
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: background,
             child: ClipRRect(
               borderRadius: BorderRadius.circular(200.0),
               child: Image.network(image),
             ),
            radius: 45,
          ),
          SizedBox(height: 10,),
          Text(name,style: TextStyle(fontSize: 15,color: Colors.white54),),


        ],
      ),
    );
  }
}
