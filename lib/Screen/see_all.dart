import 'package:flutter/material.dart';
import 'package:movies_support/JSON%20Service/movies_json_service.dart';
import 'package:movies_support/Screen/main_page.dart';
import 'package:movies_support/main.dart';
import 'package:movies_support/Widget/show.dart';
import 'package:movies_support/test.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class See_All extends StatefulWidget {
  @override
  _See_AllState createState() => _See_AllState();
}

int num = 0;

class _See_AllState extends State<See_All> {
  ListView list() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Show(MovieJson.getPosterByIndex(index, jsonResponse),
            MovieJson.getNameByIndex(index, jsonResponse), index,double.parse(MovieJson.getRatingByIndex(index, jsonResponse)),MovieJson.getGenresByIndex(index, jsonResponse));
      },
      itemCount: jsonResponse['all_movies'].length,
    );
  }

/*
    @override
    void initState() {
      setState(() {
        assignJsonResponse();
      });
      super.initState();
      num=0;
    }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Movies',style: TextStyle(fontFamily: 'Viga'),),
        centerTitle: true,
        backgroundColor: backgroun,
      ),
      body: Container(
        color: Colors.black,
        child: list(),
      ),
    );
  }
}
