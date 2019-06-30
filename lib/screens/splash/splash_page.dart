import 'package:flutter/material.dart';
import 'dart:async';
import 'package:recall_app/screens/home/home_page.dart';

class Splash extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> with TickerProviderStateMixin {

  AnimationController animationControllerHome;

  int _contentScreenState;

  void initState() {
    super.initState();
    loadData();

    animationControllerHome = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this)
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
          case AnimationStatus.completed:
            break;
          case AnimationStatus.dismissed:
            setState(() {
              _contentScreenState = 1;
            });
            //animationControllerLogin.forward();
            break;
        }
      })..addListener(() {
        setState(() {

        });
      });

    setState(() {
      _contentScreenState = 1;
    });

    animationControllerHome.forward();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage(controller: animationControllerHome)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/check_your_vehicles_logo.png'), fit: BoxFit.fitWidth),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
      ),
    );
  }
}
