import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indexapp/Activities/hello_index.dart';
import 'package:indexapp/Components/createacc_flat.dart';
import 'package:indexapp/Components/flutter_logo.dart';
import 'package:indexapp/utils/login_textstyle.dart';
import 'package:indexapp/utils/messages.dart';
import 'package:indexapp/utils/themes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController, _passwordController;
  bool _passValidation = false, _emailValidation = false;

  @override
  void initState() {
/* Triggered when the state is initialized*/
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        title: Text(
          'Flutter login demo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      /* Wrapping up the whole view in a SingleChildScrollView to avoid scrolling error*/
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LoginFlutterLogo(),
            _emailTextInput(),
            _passwordTextInput(),
            _loginButton(),
            _createAccountButton()
          ],
        ),
      ),
    );
  }

  Padding _createAccountButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, MediaQuery.of(context).size.height * 0.01, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: CreateAccountFlatButton())
        ],
      ),
    );
  }

  Padding _loginButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, MediaQuery.of(context).size.height * 0.1, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.82,
            child: RaisedButton(
              color: themdata.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              hoverColor: themdata.accentColor,
              animationDuration: Duration(seconds: 2),
              splashColor: Colors.white,
              elevation: 2,
              highlightElevation: 2,
              colorBrightness: Brightness.light,
              textTheme: ButtonTextTheme.accent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Login',
                  style: loginTextStyle,
                ),
              ),
              onPressed: () {
                setState(() {
                  _validatePassword();
                  _validateEmail();
                  _navigate();
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Padding _passwordTextInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, MediaQuery.of(context).size.height * 0.1, 0, 0),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              cursorColor: themdata.primaryColor,
              decoration: InputDecoration(
                errorText: _passValidation ? Messages.passwordError : null,
                icon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                hintText: 'Password',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _emailTextInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, MediaQuery.of(context).size.height * 0.14, 0, 0),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: _emailController,
              cursorColor: themdata.primaryColor,
              decoration: InputDecoration(
                errorText: _emailValidation ? Messages.emailError : null,
                icon: Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
                hintText: 'Email',
              ),
            ),
          ),
        ],
      ),
    );
  }

  _validatePassword() {
    _passwordController.text.isEmpty
        ? _passValidation = true
        : _passValidation = false;
  }

  _validateEmail() {
    _emailController.text.isEmpty
        ? _emailValidation = true
        : _emailValidation = false;
  }

  _navigate() {
    (_passValidation == false && _emailValidation == false)
        ? Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HelloIndex(
                      email: _emailController.text,
                      password: _passwordController.text,
                    )))
        : null;
  }
}
