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
  bool userNameTrue=false;
  bool PasswordTrue=false;
  bool NameTrue=false;
  int val_name=0;
  int val_username=0;
  int val_password=0;
  String check_User_Name(String val)
  {
    setState(() {
      userNameTrue=false;
    });
    if(val.isEmpty) {
      return 'Please Enter Your Email';
    }
    else if(!val.endsWith('@gmail.com'))
      {
      return 'Please Your email must end with @gmail.com';
      }
  setState(() {
    userNameTrue=true;
  });
  }
  String check_Password(String val)
  {
    setState(() {
      PasswordTrue=false;
    });
    if(val.isEmpty)
      return 'Please Enter Your Password';
    else if(val.length<6)
      return 'Your Password Must be more than 6 number';
    setState(() {
      PasswordTrue=true;
    });
  }
  String check_Name(String val)
  {
    if(val.isEmpty) {
     setState(() {
       NameTrue=false;
     });
      return 'Please Enter Your Name';
    }
   setState(() {
     NameTrue=true;
   });

  }
  void vaild()
  {
    val_name=1;
    val_password=1;
    val_username=1;
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
                                     prefixIcon: val_name==0? Icon(
                                      FontAwesomeIcons.user,
                                      color: kInputName,
                                    ):NameTrue==true? Icon(
                                       FontAwesomeIcons.checkCircle,
                                       color: Colors.green,
                                     ): Icon(
                                       FontAwesomeIcons.solidWindowClose,
                                       color: Colors.red,
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
                                    check_Name(val);
                                    setState(() {
                                      if (val.length > 0)
                                        kInputName = kClourMove;
                                      else
                                        kInputName = Colors.black45;
                                    });
                                  },
                                  onFieldSubmitted: (val){Name=val;val_name=1;},
                                  validator: check_Name,
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: val_username==0? Icon(
                                      FontAwesomeIcons.envelope,
                                      color: kInputEmail,
                                    ):userNameTrue==true? Icon(
                                      FontAwesomeIcons.checkCircle,
                                      color: Colors.green,
                                    ): Icon(
                                      FontAwesomeIcons.solidWindowClose,
                                      color: Colors.red,
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
                                    check_User_Name(val);
                                  },
                                  onFieldSubmitted: (val)=>User_Name=val,
                                  validator: check_User_Name,
                                ),
                                /////////////////////////////////////////////////////////////////////////////////////////
                                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: val_password==0? Icon(
                                      FontAwesomeIcons.key,
                                      color: kInputPassword,
                                    ):PasswordTrue==true? Icon(
                                      FontAwesomeIcons.checkCircle,
                                      color: Colors.green,
                                    ): Icon(
                                      FontAwesomeIcons.solidWindowClose,
                                      color: Colors.red,
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
                                    check_Password(val);
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
