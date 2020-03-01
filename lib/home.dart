import 'dart:async';

import 'package:flutter/material.dart';

import 'onboarding1.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation, size, elevation;

  void keProfile() {
    animationController.reverse();
    Timer(
      Duration(milliseconds: 600),
      () => Navigator.of(context).pushReplacement(new PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
        return new Onboarding1();
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
      duration: Duration(milliseconds: 300),
    )..addListener(() => setState(() {}));

    animation = Tween<double>(
      begin: 0.0,
      end: 300.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    elevation = Tween<double>(
      begin: 0.0,
      end: 10.0,
    ).animate(CurvedAnimation(
        curve: Interval(1.0, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    size = Tween<double>(
      begin: 0.0,
      end: 20.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
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
      body: Center(
        child: Card(
          elevation: this.elevation.value,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(this.animation.value)),
          child: Container(
            width: this.animation.value,
            height: this.animation.value,
            decoration: BoxDecoration(
              color: Color.fromRGBO(127, 71, 255, 1.0),
              borderRadius: BorderRadius.circular(this.animation.value),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 55),
                  child: Text("Online Shop",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: this.size.value,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Text("Onboarding Animation EPS 1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: this.size.value,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Text("- Radhian -",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: this.size.value,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          keProfile();
        },
        tooltip: "Go to Onboarding Screen",
         backgroundColor: Color.fromRGBO(127, 71, 255, 1.0),
        child: Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
