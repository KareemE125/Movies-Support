import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_support/JSON%20Service/movies_json_service.dart';
import 'package:movies_support/Widget/main_horizontal.dart';
import 'package:movies_support/Widget/show.dart';
import 'package:movies_support/test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';


enum Type {
  action,
  comedy,
  kids,
  Thriller,
  drama,
  crime,
}

Type ty = Type.action;
List<Map<String,Object>> Fav=[];


Color background = Color(0xff121212);

Color backgroun = Color(0xff12172D);

class Main_Page extends StatefulWidget {
  @override
  _Main_PageState createState() => _Main_PageState();
}
var mycontroller=TextEditingController();

class _Main_PageState extends State<Main_Page> {
  List genreList = [];

  @override
  void initState() {
    super.initState();
    genreList = MovieJson.getMoviesOfGenresIndexs(MovieJson.GenreAction, jsonResponse);
    print(genreList);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [

          Container(
            margin: EdgeInsets.only(right: 10,bottom: 5),
            padding: EdgeInsets.all(5.0),
            width: 250,
            child: TextField(
              controller: mycontroller,
              textInputAction: TextInputAction.search,
              onSubmitted: (val){
                for(int  i=0;i<Test.myfilm.length;i++){
                  if(val==Test.myfilm[i]['name']){
                    Navigator.of(context).pushNamed('det',
                      arguments: Test.myfilm[i]['name'],
                    );
                  }
                }
              },
              style: TextStyle(fontSize: 23,fontFamily: 'Viga'),
              cursorColor: backgroun,
              cursorHeight: 25,
              decoration: InputDecoration(
                hintText: 'Search Here',
                hintStyle: TextStyle(fontSize: 15,fontFamily: 'Viga'),
                prefixIcon: Icon(FontAwesomeIcons.search,color: backgroun,),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),

                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('fav');
            },
            child: Container(
                margin: EdgeInsets.only(right: 10.0,bottom: 5.0),
                padding: EdgeInsets.all(7.0),

                decoration: BoxDecoration(
                  color: backgroun,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Icon(Icons.favorite_border,color: Colors.red,)),
          ),
        ],

      ),
      drawer: Drawer(),
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: MediaQuery.of(context).size.height*0.03,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Popular Movies            ',
                  style: TextStyle(
                      color: Colors.white, fontSize: 26, fontFamily: 'Viga'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('see');
                  },
                  child: Text('See all',
                      style: TextStyle(
                          color: Colors.blue, fontSize: 15, fontFamily: 'Viga')),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...Test.myfilm.map((e) {
                    return Popular_Movies(e['image'], e['name']);
                  }).toList(),
                ],
              ),
            ),
            Text(
              '  Genres',
              style: TextStyle(
                  color: Colors.white, fontSize: 26, fontFamily: 'Viga'),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Button_cat(
                      ctx: context,
                      fun: () {
                        setState(() {
                          ty = Type.action;
                          genreList.clear();
                          genreList = MovieJson.getMoviesOfGenresIndexs(MovieJson.GenreAction, jsonResponse);

                        });
                      },
                      color: ty == Type.action ? Colors.blue : backgroun,
                      type: 'Action'),
                  Button_cat(
                      ctx: context,
                      fun: () {
                        setState(() {
                          ty = Type.drama;
                          genreList.clear();
                          genreList = MovieJson.getMoviesOfGenresIndexs(MovieJson.GenreDrama, jsonResponse);
                        });
                      },
                      color: ty == Type.drama ? Colors.blue : backgroun,
                      type: 'Drama'),

                  Button_cat(
                      ctx: context,
                      fun: () {
                        setState(() {
                          ty = Type.crime;
                          genreList.clear();
                          genreList = MovieJson.getMoviesOfGenresIndexs(MovieJson.GenreCrime, jsonResponse);

                        });
                      },
                      color: ty == Type.crime ? Colors.blue : backgroun,
                      type: 'Crime'),

                  Button_cat(
                      ctx: context,
                      fun: () {
                        setState(() {
                          ty = Type.kids;
                          genreList.clear();
                          genreList = MovieJson.getMoviesOfGenresIndexs(MovieJson.GenreKids, jsonResponse);

                        });
                      },
                      color: ty == Type.kids ? Colors.blue : backgroun,
                      type: 'Kids'),
                  Button_cat(
                      ctx: context,
                      fun: () {
                        setState(() {
                          ty = Type.comedy;
                          genreList.clear();
                          genreList = MovieJson.getMoviesOfGenresIndexs(MovieJson.GenreComedy, jsonResponse);

                        });
                      },
                      color: ty == Type.comedy ? Colors.blue : backgroun,
                      type: 'Comedy'),
                ],
              ),
            ),
            SizedBox(height: 20.0,),

            // ...(Film).map((e){
            //   return Show(e['image'], e['name']);
            // }).toList(),
            Container(
              height: 600,
              child: ListView.builder(
                itemBuilder: (ctx,index){

                   return Show(MovieJson.getPosterByIndex(genreList[index], jsonResponse), MovieJson.getNameByIndex(genreList[index], jsonResponse), genreList[index], double.parse(MovieJson.getRatingByIndex(genreList[index], jsonResponse)),MovieJson.getGenresByIndex(genreList[index], jsonResponse));

                },
                itemCount: genreList.length,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

Container Button_cat(
    {BuildContext ctx, String type, Function fun, Color color}) {

  return Container(
    margin: EdgeInsets.only(left: 10.0),
    child: ElevatedButton(
      onPressed: fun,
      child: Text(
        type,
        style: TextStyle(color: Colors.white,fontSize: 13),
      ),
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: 40),
      ),
    ),
  );
}
