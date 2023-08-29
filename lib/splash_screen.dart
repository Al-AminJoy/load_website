import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    print("initial");
    Timer(Duration(seconds: 5),(){
      print("initial after");

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset("images/app_icon.png",height: 250,width: 250,),
        ),
      ),
    );
  }
}
