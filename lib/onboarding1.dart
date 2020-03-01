import 'dart:async';

import 'package:flutter/material.dart';

import 'component/customRaisedButton.dart';
import 'onboarding2.dart';

class Onboarding1 extends StatefulWidget {
  @override
  _Onboarding1State createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  Animation<double> bottombg;
  Animation<double> topbg;
  Animation<double> title;
  Animation<double> desc;
  Animation<double> btndy;
  Animation<double> indicator1, indicator2, indicator3;

  void keOnboarding2() {
    animationController.reverse();
    Timer(
      Duration(milliseconds: 500),
      () => Navigator.of(context).pushReplacement(new PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
        return new Onboarding2();
      }, transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
        return new FadeTransition(opacity: animation, child: child);
      })),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(() => setState(() {}));

    animation = Tween<double>(
      begin: 0.0,
      end: 300.0,
    ).animate((CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController)));

    title = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    btndy = Tween<double>(
      begin: 100.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    desc = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.9, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    bottombg = Tween<double>(
      begin: 150.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.3, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    topbg = Tween<double>(
      begin: -250.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    indicator1 = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    indicator2 = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    indicator3 = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          //frametop
          Positioned(
              top: 0,
              child: Transform.translate(
                offset: Offset(0, this.topbg.value),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: Image.asset("assets/topbg.png"),
                ),
              )),

          //framebottom
          Positioned(
              bottom: 0,
              child: Transform.translate(
                offset: Offset(this.bottombg.value, 50),
                child: Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Colors.transparent,
                  child: Image.asset("assets/bottombg.png"),
                ),
              )),

          //title
          Positioned(
              top: 100,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text("Free Shipping",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(
                                64, 74, 105, this.title.value)))),
              )),

          //indicator
          Positioned(
            bottom: 40,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(0.0, this.indicator1.value),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(127, 71, 255, 1.0),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(width: 16),
                  Transform.translate(
                    offset: Offset(0.0, this.indicator2.value),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(105, 133, 148, 1),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(width: 16),
                  Transform.translate(
                    offset: Offset(0.0, this.indicator3.value),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(105, 133, 148, 1),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ),

          //button next
          Positioned(
              bottom: 20,
              right: 20,
              child: Transform.translate(
                offset: Offset(0.0, this.btndy.value),
                child: RaisedGradientButton(
                    radius: 55.0,
                    width: 55.0,
                    height: 55.0,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(167, 133, 246, 1.0),
                        Color.fromRGBO(127, 71, 255, 1.0)
                      ],
                    ),
                    onPressed: () {
                      keOnboarding2();
                    }),
              )),

          //image center    
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: this.animation.value,
                    height: this.animation.value,
                    child: Image.asset("assets/onboarding1.png")),
                SizedBox(height: 32),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height / 12),
                  child: Center(
                      child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(105, 133, 148, this.desc.value)),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          keOnboarding2();
        },
        backgroundColor: Color.fromRGBO(127, 71, 255, 1.0),
        child: Text("Next"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      */
    );
  }
}
