import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jivan/constants.dart';
import 'package:jivan/jivan_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;

  String? email;
  String? password;

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jivan says LogIn!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                hintText: 'Email',
              ),
              onChanged: (value) {
                email = value; // todo compare with DB
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextField(
              obscureText: obscureText,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Password',
              ),
              onChanged: (value) {
                password = value; // todo compare with DB
              },
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () async {
              try {
                final findUser = await _auth.signInWithEmailAndPassword(email: email!, password: password!);
                if(findUser != null) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => JivanPage()));
                }
              } catch(e) {
                print(e);
              }
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 50,
              child: Center(child: Text('LogIn')),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primaryColour,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// user login info
// todo if password matches username take then to their jivan page and retrieve the device model list and room model list