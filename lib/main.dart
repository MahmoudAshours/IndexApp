import 'package:flutter/material.dart';
import 'package:indexapp/utils/themes.dart';
import 'Activities/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /* Building our Main Stateless widget*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themdata,
      title:'Index App',
      home: Login(),
    );
  }
}
