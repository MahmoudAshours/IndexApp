import 'package:flutter/material.dart';

class CreateAccountFlatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Text(
          'Create an account',
          style: TextStyle(
              color: Colors.grey, fontSize: 15, fontStyle: FontStyle.normal),
        ),
      ),
      onPressed: () {},
    );
  }
}
