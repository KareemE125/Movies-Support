import 'package:flutter/material.dart';
import '../Screen/main_page.dart';
import 'package:movies_support/test.dart';


class Show extends StatefulWidget {
  final String name;
  final String image;
  final int indx;
  Show(this.image, this.name,this.indx);
  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {

  Color OFF=Color(0xff535782);

  Color ONN= Colors.red;

  Color Current=Color(0xff535782);

  int Sizee=25;

  bool stat = false;

  void change(){
    setState(() {
      if(stat){
        Current=OFF;
        stat=false;
        Sizee=25;
        for(int i=0; i<Fav.length;i++){
          if(widget.name==Fav[i]['name'])
            {
              Fav.removeAt(i);
            }
        }

      }else{
        Current=ONN;
        stat=true;
        Sizee=29;
        Fav.add(Test.myfilm[widget.indx]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('det',arguments:
          widget.name,
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 130.0),
        margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 15),
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.23,

        decoration: BoxDecoration(
          color: Color(0xff11182E),
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image:NetworkImage(widget.image),
            alignment: Alignment.topLeft,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.45,),

                widget.indx!=-1?IconButton(icon: Icon(Icons.favorite,color: Current,size: Sizee.toDouble(),), onPressed: change):
               Text('      \n\n'),
              ],
            ),
            SizedBox(height: 0.0,),
            Container(
              padding: EdgeInsets.only(left: 10),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow,size: 15,),
                      Icon(Icons.star,color: Colors.yellow,size: 15),
                      Icon(Icons.star,color: Colors.yellow,size: 15),
                      Icon(Icons.star_half_rounded,color: Colors.yellow,size: 15),
                      Icon(Icons.star,color: Color((0xff535782)),size: 15),
                      SizedBox(width: 10.0,),
                      Text('8.0',style: TextStyle(color: Colors.white30,fontSize: 14.0)),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Text('Carton,friction,action',style: TextStyle(color: Colors.white30,fontSize: 15.0)),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
