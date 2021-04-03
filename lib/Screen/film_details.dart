import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_support/JSON%20Service/movies_json_service.dart';
import 'package:movies_support/Screen/main_page.dart';
import 'package:movies_support/Widget/cast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../Widget/show.dart';

import '../main.dart';

class Film_Details extends StatefulWidget {
  @override
  _Film_DetailsState createState() => _Film_DetailsState();

}

enum Stat { happy, sad, no }

class _Film_DetailsState extends State<Film_Details> {
  Stat mood = Stat.no;
  var happy = Colors.green;
  Color normal = Colors.white;
  Color st = Colors.white;
  Color OFF = Colors.white;

  Color ONN = Colors.red;

  Color Current = Colors.white;

  int Sizee = 30;

  bool stat = false;

  void change() {
    setState(() {
      if (stat) {
        Current = OFF;
        stat = false;
        Sizee = 30;
      } else {
        Current = ONN;
        stat = true;
        Sizee = 35;
      }
    });
  }

  Future<void> openFilm(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ID = ModalRoute.of(context).settings.arguments;

    String Genres(){
      String ahmed='';
      for(String s in MovieJson.getGenresByIndex(ID, jsonResponse) ){
        ahmed+=s.toString();
        if(s.toString() == MovieJson.getGenresByIndex(ID, jsonResponse).last){ break; }
        ahmed+=', ';

      }
      return ahmed;
    }

    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.network(
                      MovieJson.getWPosterByIndex(ID, jsonResponse),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: Center(
                    child: GestureDetector(
                      onTap: () => openFilm(MovieJson.getWatch1080pByIndex(ID, jsonResponse)),
                      child: Image.asset(
                        'assets/images/mov/icoon.png',
                        width: 75,
                        height: 110,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: IconButton(
                      splashColor: Colors.red,
                      icon: Icon(
                        Icons.favorite,
                        color: Current,
                        size: Sizee.toDouble(),
                      ),
                      onPressed: change),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Text(
                      ' ${MovieJson.getNameByIndex(ID, jsonResponse)}',
                      style: TextStyle(
                          fontSize: 30, color: Colors.white, fontFamily: 'Viga'),
               
                    ),
                  ),
                  
                  SizedBox(),
                  draw(context, double.parse(MovieJson.getRatingByIndex(ID, jsonResponse))),
                  Text(' ${MovieJson.getRatingByIndex(ID, jsonResponse)}',
                      style: TextStyle(color: Colors.white30, fontSize: 18.0)),


                   
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text('    ${Genres()}  |  ${MovieJson.getDurationByIndex(ID, jsonResponse)}',
                style: TextStyle(color: Colors.white30, fontSize: 14.0)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              margin: EdgeInsets.only(left: 7.0, right: 20),
              child: Wrap(children: [
                Text('${MovieJson.getStoryByIndex(ID, jsonResponse)}',
                    style: TextStyle(color: Colors.white70, fontSize: 17.0))
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              ' The Cast',
              style: TextStyle(
                  fontSize: 30, color: Colors.white, fontFamily: 'Viga'),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx,index){
                  return TheCast(MovieJson.getActorsPicsUrlListByIndex(ID, jsonResponse)[index], MovieJson.getActorsNamesListByIndex(ID, jsonResponse)[index]);
                },
                itemCount: MovieJson.getActorsNamesListByIndex(ID, jsonResponse).length,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.43,
              decoration: BoxDecoration(
                color: backgroun,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '    Viewers liked this movie     ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Viga',
                                fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.mood_outlined,
                                  color: mood == Stat.happy
                                      ? Colors.green
                                      : Colors.white,
                                  size: mood == Stat.happy ? 40 : 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (mood == Stat.no || mood == Stat.sad) {
                                      mood = Stat.happy;
                                    } else if (mood == Stat.happy) {
                                      mood = Stat.no;
                                    }
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.mood_bad_outlined,
                                  color: mood == Stat.sad
                                      ? Colors.red
                                      : Colors.white,
                                  size: mood == Stat.sad ? 40 : 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (mood == Stat.no || mood == Stat.happy) {
                                      mood = Stat.sad;
                                    } else if (mood == Stat.sad) {
                                      st = normal;
                                      mood = Stat.no;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircularPercentIndicator(
                        radius: 80.0,
                        lineWidth: 5.0,
                        percent: double.parse(MovieJson.getRatingByIndex(ID, jsonResponse))/10,
                        center: Text(
                          "${double.parse(MovieJson.getRatingByIndex(ID, jsonResponse))*10}%",
                          style: TextStyle(color: Colors.white),
                        ),
                        progressColor: Colors.deepOrange,
                        animation: true,
                        animationDuration: 2000,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.272,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60),
                          topLeft: Radius.circular(60)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        ElevatedButton.icon(onPressed: () {
                          openFilm(MovieJson.getWatch1080pByIndex(ID, jsonResponse));
                        },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 65),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                          ),
                           icon: Icon(FontAwesomeIcons.video),
                          label: Text('Watch',style: TextStyle(fontSize: 20,fontFamily: 'Viga'),),
                        ),
                        SizedBox(height: 30,),



                        ElevatedButton.icon(onPressed: () {
                          openFilm(MovieJson.getDownLoad1080pByIndex(ID, jsonResponse));

                        },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 70),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                          ),
                          icon: Icon(FontAwesomeIcons.download),
                          label: Text('Download',style: TextStyle(fontSize: 20,fontFamily: 'Viga'),),
                        ),
                      ],
                    ),
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
//The events of the movie revolve around the young Chinese girl Mulan who aspires to more than an ordinary life and a traditional marriage, by disguising himself in the image and dress of a warrior, in order to save her father.
