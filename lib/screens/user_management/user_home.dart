import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class User_home extends StatefulWidget {
  static String routeName = 'user_home';
  const User_home({Key? key}) : super(key: key);

  @override
  State<User_home> createState() => _user_homeState();
}

class _user_homeState extends State<User_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 35.0),
            Container(
              height: 400,
              child: const Image(
                image: AssetImage('assets/images/user_management/login.jpg'),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
                text: const TextSpan(
                    text: 'Welcome to',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'The Quote App',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue))
                ])),
            const SizedBox(height: 10.0),
            const Text(
              'Be the chnage you want to see in the World',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  onPressed: () {},
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue,
                ),
                const SizedBox(width: 20.0),
                RaisedButton(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  onPressed: () {},
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
