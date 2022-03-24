import 'package:flutter/material.dart';

class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height/7),
            child: Text('')
          ),

          Image.asset('img/logoHP.png', width: 120, height: 120),
          //Text("Horrocrux", style: TextStyle(color: Colors.black, fontSize: 16))
          

        ]
      )
    );    
  }

}