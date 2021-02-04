import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color kInputName = Colors.black45;
const kClourMove = Color(0xFF4A19AC);
const kClourblack = Colors.black45;
Color kInputEmail = Colors.black45;
Color kInputPassword = Colors.black45;
Color kInputIcon = Colors.black45;


class Register extends StatefulWidget {



  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FormKey=GlobalKey<FormState>();
  String Name;
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
  String check_Name(String val)
  {
    if(val.isEmpty)
      return 'Please Enter Your Name';

  }
  void vaild()
  {
    if(FormKey.currentState.validate())
    {
      print(User_Name +'  '+Password);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 20.0,),
                            CircleAvatar(
                              radius: 18.0,
                              backgroundColor: kClourMove,
                            ),
                            SizedBox(width:MediaQuery.of(context).size.width * 0.65),

                            CircleAvatar(
                              radius: 15.0,
                              backgroundColor: kClourMove,
                            ),

                          ],
                        ),

                        Text(
                          'Register',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40.0,
                              color: kClourMove),
                        ),
                        Row(
                          children: [
                            SizedBox(width:MediaQuery.of(context).size.width * 0.15),
                            CircleAvatar(
                              radius: 10.0,
                              backgroundColor: kClourMove,
                            ),
                            SizedBox(width:MediaQuery.of(context).size.width * 0.69),

                            CircleAvatar(
                              radius: 5.0,
                              backgroundColor: kClourMove,
                            ),

                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Form(
                            key: FormKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.user,
                                      color: kInputName,
                                    ),
                                    labelText: 'Your Name',
                                    labelStyle: TextStyle(
                                        color: kInputName,
                                        fontFamily: 'Viga',
                                        fontSize: 20.0),
                                  ),
                                  style: TextStyle(
                                      color: kClourMove, fontFamily: 'Viga'),
                                  onChanged: (val){
                                    setState(() {
                                      if (val.length > 0)
                                        kInputName = kClourMove;
                                      else
                                        kInputName = Colors.black45;
                                    });
                                  },
                                  onFieldSubmitted: (val)=>Name=val,
                                  validator: check_Name,
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.envelope,
                                      color: kInputEmail,
                                    ),
                                    labelText: 'Your Email',
                                    labelStyle: TextStyle(
                                        color: kInputEmail,
                                        fontFamily: 'Viga',
                                        fontSize: 20.0),
                                  ),
                                  style: TextStyle(
                                      color: kClourMove, fontFamily: 'Viga'),
                                  onChanged: (val){
                                    setState(() {
                                      if (val.length > 0)
                                        kInputEmail = kClourMove;
                                      else
                                        kInputEmail = Colors.black45;
                                    });
                                  },
                                  onFieldSubmitted: (val)=>User_Name=val,
                                  validator: check_User_Name,
                                ),
                                /////////////////////////////////////////////////////////////////////////////////////////
                                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.key,
                                      color: kInputPassword,
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        color: kInputPassword,
                                        fontFamily: 'Viga',
                                        fontSize: 20.0),
                                  ),
                                  style: TextStyle(
                                      color: kClourMove, fontFamily: 'Viga'),
                                  onChanged: (val){
                                    setState(() {
                                      if (val.length > 0)
                                        kInputPassword = kClourMove;
                                      else
                                        kInputPassword = Colors.black45;
                                    });
                                  },
                                  obscureText: !showPass,
                                  onFieldSubmitted: (val)=>Password=val,
                                  validator: check_Password,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(value: showPass, onChanged: (val){
                                        setState(() {
                                          showPass=val;
                                          if(val)
                                            {
                                              kInputIcon=kClourMove;
                                              icee=FontAwesomeIcons.eye;
                                            }
                                          else{
                                            kInputIcon=kClourblack;
                                            icee=FontAwesomeIcons.eyeSlash;

                                          }
                                        });

                                      },
                                        title: Text('Show Password',style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16.0,
                                            color: kClourMove),),
                                        controlAffinity: ListTileControlAffinity.leading,
                                        activeColor: kClourMove,
                                        secondary: Icon(icee,color: kInputIcon,),
                                      
                                      ),
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
              SizedBox(height: MediaQuery.of(context).size.height*0.001,),
              FlatButton(onPressed: (){
                vaild();
                //Navigator.pushReplacementNamed(context, 'login');
              }, child:   Text('Register',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22.0,letterSpacing: 2.0,color: Colors.white),),
                color: kClourMove ,
                padding: EdgeInsets.symmetric(
                    vertical: 13.0, horizontal: 70.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.36,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/login/under1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
bool showPass=false;
IconData icee=FontAwesomeIcons.eyeSlash;
