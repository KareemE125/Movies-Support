import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gooey_carousel/gooey_carrousel.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

const kClourMove = Color(0xFF7D36FE);
const kClourblack = Colors.black45;
Color kInputEmail = Colors.black45;
Color kInputPassword = Colors.black45;
Color kInputIcon = Colors.black45;


class _loginState extends State<login> {
final FormKey=GlobalKey<FormState>();
  bool passwoed_secure = true;
  String User_Name;
  String Password;
  String check_User_Name(String val)
  {
      if(val.isEmpty)
       return 'Please Enter Your Email';
      else if(!val.endsWith('@gmail.com'))
        return 'Please Your email must end with @gmail.com';

  }
  String check_Password(String val)
  {
   if(val.isEmpty)
     return 'Please Enter Your Password';
   else if(val.length<6)
     return 'Your Password Must be more than 6 number';
  }
void vaild()
{
  if(FormKey.currentState.validate())
  {
    print(User_Name +'  '+Password);
  }
}

Container Show_Image(String image)
{
  return   Container(height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      color: Colors.white70,
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: GooeyCarousel(
          children: [

            Show_Image('images/mov/venom.jpg'),
            Show_Image('images/mov/kingKong.jpg'),
            Show_Image('images/mov/jocker2.jpeg'),
            Show_Image('images/mov/movie2.jpg'),




            Container(
              color: Colors.white70,
              height:  MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.67,
                        decoration: BoxDecoration(
                          color: kClourMove,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60.0),
                              bottomRight: Radius.circular(60)),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.08,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'MOVIES',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontFamily: 'Pacifico',
                                      fontWeight: FontWeight.w900
                                  ),
                                ),
                                SizedBox(width: 8.0,),
                                Icon(FontAwesomeIcons.video,color: Colors.white70,size: 25.0,),
                                SizedBox(width: 8.0,),
                                Text(
                                  'APP',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontFamily: 'Pacifico',
                                      fontWeight: FontWeight.w900
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 280,
                              child: Divider(thickness: 3.0,color: Colors.white70,),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              'Fill The Below information to login in',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Viga',
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 35.0,right: 35.0 ,top: 20.0,bottom: 20.0),
                              height: MediaQuery.of(context).size.height * 0.63,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.02,
                                  ),
                                  Center(
                                    child: Text(
                                      'Login Account',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontFamily: 'Viga',
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:  MediaQuery.of(context).size.height*0.02,
                                  ),
                                  Form(
                                    key: FormKey,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.person,
                                                color: kInputEmail,
                                                size: 20,
                                              ),
                                              hintText: 'User Name',
                                              labelStyle:
                                              TextStyle(color: kInputEmail),
                                              isDense: true,
                                            ),
                                            onChanged: (val) {
                                              setState(() {
                                                if (val.length > 0)
                                                  kInputEmail = kClourMove;
                                                else
                                                  kInputEmail = Colors.black45;
                                              });
                                            },
                                            style: TextStyle(
                                                color: kClourMove,
                                                fontFamily: 'Viga'),
                                            validator: check_User_Name,
                                            onFieldSubmitted: (val)=>User_Name=val,

                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.04,
                                          ),
                                          TextFormField(
                                            style: TextStyle(
                                                color: kClourMove,
                                                fontFamily: 'Viga'),
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.vpn_key,
                                                color: kInputPassword,
                                                size: 30,
                                              ),
                                              suffixIcon: FlatButton(
                                                child: Icon(
                                                  ice,
                                                  size: 25.0,
                                                  color: kInputIcon,
                                                ),
                                                padding: EdgeInsets.all(0.0),
                                                onPressed: () {
                                                  setState(() {
                                                    if (passwoed_secure) {
                                                      passwoed_secure = false;
                                                      kInputIcon = kClourMove;
                                                      ice=FontAwesomeIcons.eye;
                                                    } else {
                                                      passwoed_secure = true;
                                                      kInputIcon = Colors.black45;
                                                      ice=FontAwesomeIcons.eyeSlash;

                                                    }
                                                  });
                                                },
                                              ),
                                              hintText: 'Password',
                                              labelStyle:
                                              TextStyle(color: kInputPassword),
                                              isDense: true,
                                            ),
                                            onChanged: (val) {
                                              setState(() {
                                                if (val.length > 0)
                                                  kInputPassword = kClourMove;
                                                else
                                                  kInputPassword = Colors.black45;
                                              });
                                            },
                                            obscureText: passwoed_secure,
                                            validator: check_Password,
                                            onFieldSubmitted: (val)=>Password=val,
                                          ),
                                          Row(
                                            children: [
                                              FlatButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'Forget My Password',
                                                  style: TextStyle(
                                                    color: kClourMove,
                                                    fontFamily: 'Viga',
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25.0, vertical: 0.0),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:MediaQuery.of(context).size.height*0.011,
                                          ),
                                          RaisedButton(
                                            onPressed: vaild,
                                            color: kClourMove,
                                            child: Text(
                                              'LOG IN',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Viga',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900,
                                                  letterSpacing: 1.0),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(25.0)),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 17.0, horizontal: 100.0),
                                            elevation: 10.0,
                                          ),
                                          Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  SizedBox(
                                                    height: MediaQuery.of(context).size.height*0.07,
                                                    child: Divider(thickness: 2.0,),
                                                  ),
                                                  Positioned(
                                                    left: MediaQuery.of(context).size.width*0.32,
                                                    top: MediaQuery.of(context).size.height*0.015,
                                                    child: Container(

                                                      padding: EdgeInsets.all(6.0),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFF3A2BCD),
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                      child: Text('OR',style: TextStyle(color: Colors.white,fontSize: 15.0,fontFamily: 'Viga'),),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  SizedBox(),

                                                  Column(
                                                    children: [
                                                      Icon(FontAwesomeIcons.facebook,color: Colors.blue,
                                                        size: 35.0,),
                                                      SizedBox(height: 5.0,),
                                                      Text('facebook'),
                                                    ],
                                                  ),

                                                  Column(
                                                    children: [
                                                      Icon(FontAwesomeIcons.google,color: Colors.red,
                                                        size: 35.0,),
                                                      SizedBox(height: 5.0,),
                                                      Text('Google'),
                                                    ],
                                                  ),
                                                  SizedBox(),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  FlatButton(onPressed: (){
                    Navigator.pushNamed(context, 'register');
                  }, child: Column(
                    children: [
                      Text('Don\'t have an account ?',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 17.0),),
                      SizedBox(height: 5.0,),
                      Text('Register',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 17.0,color: kClourMove),),


                    ],
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
IconData ice=FontAwesomeIcons.eyeSlash;
