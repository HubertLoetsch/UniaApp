import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/main.dart';
import 'package:flutter_news_app/src/pages/homePage/homePage.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

// Global Variables
var _username = ["1"];
var _password = ["1"];


class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        backgroundColor: Colors.black,
        fontFamily: 'SanFrancisco',
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromRGBO(33, 32, 45, 1.0),
        body: LoginScreen(),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "UNIA",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  //textAlign: TextAlign.center,
                ),
              ),
            )),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;

  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
    ..onTap = () {
      if (kDebugMode) {
        print("Error");
      }
    };

  bool fetchCredentials(String username, String password) {
    for (var j = 0; j < _username.length; j++) {
      if (username == _username[j] && password == _password[j]) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
              width: 200,
            ),

            // Login text Widget
            Center(
              child: Container(
                height: 200,
                width: 400,
                alignment: Alignment.center,
                child: Text(
                  "Welcome to Unia",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(
              height: 60,
              width: 10,
            ),

            // Wrong Password text
            Visibility(
              visible: _isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Please Enter a UserName and Password",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                ),
              ),
            ),

            // Textfields for username and password fields
            Container(
              height: 140,
              width: 530,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white60),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },
                    controller: usernameController, // Controller for Username
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  TextFormField(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },

                    controller: passwordController, // Controller for Password
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        contentPadding: EdgeInsets.all(20),
                        // Adding the visibility icon to toggle visibility of the password field
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )),
                    obscureText: _isObscure,
                  ),
                ],
              ),
            ),

            // Submit Button
            Container(
              width: 570,
              height: 70,
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                  color: Colors.red,
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    if (kDebugMode) {
                      print(
                          "Username: ${usernameController.text}, password: ${passwordController.text}");
                    }
                    if (fetchCredentials(
                        usernameController.text, passwordController.text)) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false ,
                      );
                    } else {
                      setState(() {
                        _isVisible = true;
                      });
                    }
                  }),
            ),
          ],
        ));
  }
}

