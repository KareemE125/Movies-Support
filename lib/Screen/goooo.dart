import 'package:flutter/material.dart';

class Goooo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            child: Text('fooo'),
            onPressed: (){
              Navigator.of(context).pushNamed('go');
            },
          ),

        ),
      ),
    );
  }
}
