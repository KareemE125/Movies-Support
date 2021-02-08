import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:gooey_carousel/gooey_carrousel.dart';


class intro extends StatelessWidget {
  List<PageViewModel> mypages = [
    Pages(
        //'assets/images/IntroScreen/pic4.png',
         'assets/images/mov/movies2.png',
        "Welcome To Movies App",
        "We Are Glad That You Use Our App And We Hope To Enjoy With This Movies App. ",
        ),
   Pages(
      'assets/images/IntroScreen/pic9.png',
      "Choose Any Movie",
      "You Can Choose Any Movie Do You Want To Watch It And Enjoy With it just Click On it and Watch to Enjoy.",
    ),
    Pages(
      'assets/images/IntroScreen/download.png',
      "You Can Download",
      "yeah, You Can download any movie do you want from our app just click on download and it download.",
    ),
    Pages(
      'assets/images/IntroScreen/pic5.png',
      "Relax And watched ",
      "We Are Glad That You Use Our App And We Hope To Enjoy With This Movies App ",
    ),
    Pages(
      'assets/images/IntroScreen/pic10.png',
      "Finish",
      "First you should create an account to you with email and password to enjoy with this app",
    ),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: mypages,
          onDone: () {
            Navigator.pushNamed(context, 'login');
          },
          showSkipButton: false,
           //next: const Icon(Icons.next_plan_outlined),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.0)),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(30.0, 10.0),
              activeColor: Colors.deepPurple,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}

PageViewModel Pages(String img, String header, String txt) {
  return PageViewModel(
      title: header,
      body:  txt,

      image: Container(
        margin: EdgeInsets.only(top: 50.0),
        // padding: EdgeInsets.all(50.0),
        decoration: BoxDecoration(
          //shape: BoxShape.circle,
          /* border: Border.all(
             color: Colors.black,
             width: 1.0,
             style: BorderStyle.solid),*/

          image: DecorationImage(
            image: AssetImage(img),
           // fit: BoxFit.cover,
          ),
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w700, fontSize: 25.0),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ));
}
