import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


/// READ SO IMPORTANT TO BE ABLE TO DEAL WITH THAT CLASS

///That class is made to ease for you dealing with the json file's data
///these functions are made to be used accompanied with listView.builder either in vertical or horizontal Axis
///here you have method for each movie property
///method for getting lists of index for movies in a specific movie category like:(popular movies,.....)
///method for getting lists of index for movies that have specific genre like:(Action, Crime, .....)
///also a startup method that decode the json file with is IMPORTANT to call in the initState() method
///otherwise these function won't run
///and here is an example in code
/////////////////////////////////////////////////////////////////
//   you should call MovieJson.parseJson() first in initstate()
//   to decode json file data as following:
//
/////////////////////////////////////////////////////////////////
//     var jsonResponse;
//
//     void assignJsonResponse()async{
//       jsonResponse= await MovieJson.parseJson();
//     }
//
//     @override
//     void initState() {
//       assignJsonResponse();
//       super.initState();
//     }
//////////////////////////////////////////////////////////////////


class MovieJson {

  static const GenreAction = 'Action';
  static const GenreCrime = 'Crime';
  static const GenreDrama = 'Drama';
  static const GenreKids = 'Kids';
  static const GenreComedy = 'Comedy';



  static Future parseJson() async {
    String jsonString = await rootBundle.loadString("assets/movies");
    final jsonResponse = jsonDecode(jsonString);
    return jsonDecode(jsonString);
  }

  static List<int> getMoviesOfGenresIndexs(String genre, var jsonResponse){
    List<int> indexs = [];
    for(int i = 0; i < jsonResponse['all_movies'].length; i++){
      for( var value in getGenresByIndex(i,jsonResponse))
       if(genre == value){
        indexs.add(i);
      }
    }
    return indexs;
  }

  static List<int> getPopularIndexs(var jsonResponse){
    List<int> indexs = [];
    for(var h in jsonResponse['popular_movies']){
      indexs.add(h['id']);
    }
    return indexs;
  }

  static String getNameByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['name']; }

  static String getPosterByIndex(int index, var jsonResponse) { return  jsonResponse['all_movies'][index]['poster_path']; }

  static String getWPosterByIndex(int index, var jsonResponse) { return  jsonResponse['all_movies'][index]['wposter_path']; }

  static String getYearByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['year']; }

  static String getStoryByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['story']; }

  static String getLanguageByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['language']; }

  static String getCountryByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['country']; }

  static String getRatingByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['rating']; }

  static String getDurationByIndex(int index, var jsonResponse) { return  jsonResponse['all_movies'][index]['duration']; }

  static List<String> getGenresByIndex(int index, var jsonResponse)
  {
    List<String> genres = [];
    for( var g in jsonResponse['all_movies'][index]['genres'] ){
      genres.add(g['genre'].toString());
    }
    return genres;
  }

  //// Director //// Director //// Director //// Director //// Director //// Director //// Director
  static String getDirectorNameByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['cast'][0]['director']; }

  static String getDirectorRoleByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['cast'][0]['role']; }

  static String getDirectorPicUrlByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['cast'][0]['pic']; }
  //// Director //// Director //// Director //// Director //// Director //// Director //// Director

  //// ACTORS //// ACTORS //// ACTORS //// ACTORS //// ACTORS //// ACTORS //// ACTORS //// ACTORS
  static List<String> getActorsNamesListByIndex(int index, var jsonResponse)
  {
    List<String> actorsNames = [];
    for( var n in jsonResponse['all_movies'][index]['cast'][1]['actors'] ){
      actorsNames.add(n['actor'].toString());
    }
    return actorsNames;
  }

  static List<String> getActorsRolesListByIndex(int index, var jsonResponse)
  {
    List<String> actorsRoles = [];
    for( var r in jsonResponse['all_movies'][index]['cast'][1]['actors'] ){
      actorsRoles.add(r['role'].toString());
    }
    return actorsRoles;
  }

  static List<String> getActorsPicsUrlListByIndex(int index, var jsonResponse)
  {
    List<String> actorsPics = [];
    for( var p in jsonResponse['all_movies'][index]['cast'][1]['actors'] ){
      actorsPics.add(p['pic'].toString());
    }
    return actorsPics;
  }
  //// ACTORS //// ACTORS //// ACTORS //// ACTORS //// ACTORS //// ACTORS //// ACTORS //// ACTORS

  //// WATCH //// WATCH //// WATCH //// WATCH //// WATCH //// WATCH //////// WATCH //// WATCH ////
  //static String getWatch360pByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['watch']['360p']; }

  //static String getWatch480pByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['watch']['480p']; }

  //static String getWatch720pByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['watch']['720p']; }

  static String getWatch1080pByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['watch']['1080p']; }
  //// WATCH //// WATCH //// WATCH //// WATCH //// WATCH //// WATCH //// WATCH //// WATCH ////

  //// DOWNLOAD //// DOWNLOAD //// DOWNLOAD //// DOWNLOAD //// DOWNLOAD //// DOWNLOAD
  //static String getDownLoad360pByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['download']['360p']; }

  //static String getDownLoad480pByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['download']['480p']; }

  //static String getDownLoad720pByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['download']['720p']; }

  static String getDownLoad1080pByIndex(int index, var jsonResponse) { return jsonResponse['all_movies'][index]['download']['1080p']; }
  //// DOWNLOAD //// DOWNLOAD //// DOWNLOAD //// DOWNLOAD //// DOWNLOAD //// DOWNLOAD

}


/// down here there is an app that you can run just to be able to try
/// all the functions in the console if you want to
/// you will find them all commented in assignJsonResponse() function
/// which is called in initState() so when the app runs all the function in
/// assignJsonResponse() will run automatically

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var jsonResponse;
  void assignJsonResponse()async{
    jsonResponse= await MovieJson.parseJson();


    // all function if you want to try them in the consle

    //print(MovieJson.getMoviesOfGenresIndexs(MovieJson.GenreAction,jsonResponse));

    //print(MovieJson.getPopularIndexs(jsonResponse));

    //print(MovieJson.getNameByIndex(0, jsonResponse));

    //print(MovieJson.getPosterByIndex(0, jsonResponse));

    //print(MovieJson.getYearByIndex(0, jsonResponse));

    //print(MovieJson.getStoryByIndex(0, jsonResponse));

    //print(MovieJson.getLanguageByIndex(0, jsonResponse));

    //print(MovieJson.getCountryByIndex(0, jsonResponse));

    //print(MovieJson.getRatingByIndex(0, jsonResponse));

    //print(MovieJson.getDurationByIndex(0, jsonResponse));

    //print(MovieJson.getGenresByIndex(0, jsonResponse));

    //print(MovieJson.getDirectorNameByIndex(0, jsonResponse));

    //print(MovieJson.getDirectorRoleByIndex(0, jsonResponse));

    //print(MovieJson.getDirectorPicUrlByIndex(0, jsonResponse));

    //print(MovieJson.getActorsNamesListByIndex(0, jsonResponse));

    //print(MovieJson.getActorsRolesListByIndex(0, jsonResponse));

    //print(MovieJson.getActorsPicsUrlListByIndex(0, jsonResponse));

    //print(MovieJson.getWatch360pByIndex(0, jsonResponse));

    //print(MovieJson.getWatch480pByIndex(0, jsonResponse));

    //print(MovieJson.getWatch720pByIndex(0, jsonResponse));

    //print(MovieJson.getWatch1080pByIndex(0, jsonResponse));

    //print(MovieJson.getDownLoad360pByIndex(0, jsonResponse));

    //print(MovieJson.getDownLoad480pByIndex(0, jsonResponse));

    //print(MovieJson.getDownLoad720pByIndex(0, jsonResponse));

    //print(MovieJson.getDownLoad1080pByIndex(0, jsonResponse));
  }

  @override
  void initState() {
    assignJsonResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Text('MovieJson',style: TextStyle(fontSize: 50),)
        )
      )
    );
  }

}




/*
Json file example
   {
      "id" : 2,
      "name" : "write_the_name",
      "poster_path" : "add_poster_url",
      "wposter_path" : "add_poster_url_by_width",
      "year": "add_the_year",
      "story" : "add_the_story",
      "language" : "add_the_lang",
      "country" : "add_the_country",
      "genres": [
        { "genre" : "add_the_genre" },
        { "genre" : "add_the_genre" },
        { "genre" : "add_the_genre" }
      ],
      "rating" : "add_the_rating",
      "duration" : "add_the_duration",
      "cast" : [
        {
          "director" : "add_the_name",
          "role" : "add_the_role",
          "pic" : "add_the_pic_url"
        },
        {
          "actors" : [
            {
              "actor" : "add_the_name",
              "role" : "add_the_role",
              "pic" : "add_the_pic_url"
            },
            {
              "actor" : "add_the_name",
              "role" : "add_the_role",
              "pic" : "add_the_pic_url"
            }
          ]
        }
      ],
      "watch" :{
        "1080p" : "add_the_url"
      },
      "download" : {
        "1080p" : "add_the_url"
      }

    }
 */