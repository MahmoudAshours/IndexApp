import 'package:flutter/material.dart';
import 'package:indexapp/utils/custom_colors.dart';
import 'package:indexapp/utils/login_textstyle.dart';

class HelloIndex extends StatefulWidget {
  final String email, password;
  HelloIndex({this.email, this.password});

  @override
  _HelloIndexState createState() => _HelloIndexState();
}

class _HelloIndexState extends State<HelloIndex> {
  double containerWidth = 150;
  double containerheight = 150;
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  "Your E-mail is ${widget.email}",
                  style: loginTextStyle,
                ),
              ),
              Container(
                child: Text(
                  "Your password is ${widget.password}",
                  style: loginTextStyle,
                ),
              ),
              indexContainer(),
              indexButton()
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton indexButton() {
    return RaisedButton(
      child: Text('Click me!'),
      onPressed: () {
        setState(() {
          _onClickListener();
        });
      },
    );
  }

  AnimatedContainer indexContainer() {
    return AnimatedContainer(
      width: containerWidth,
      height: containerheight,
      duration: Duration(seconds: 3),
      curve: Curves.bounceInOut,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: new ExactAssetImage('assets/indexgrp.png'),
        ),
      ),
    );
  }

  _onClickListener() {
    ispressed
        ? {ispressed = false, containerheight = 150, containerWidth = 150}
        : {ispressed = true, containerheight = 600, containerWidth = 300};
  }
}
