import 'package:flutter/material.dart';

class LoginFlutterLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, MediaQuery.of(context).size.height * 0.08, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlutterLogo(
            size: 100,
          ),
        ],
      ),
    );
  }
}
