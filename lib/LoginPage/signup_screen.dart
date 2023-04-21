import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jivan/constants.dart';
import 'package:jivan/jivan_page.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;

  String? email;
  String? password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jivan says SignUp!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                hintText: 'Email',
              ),
              onChanged: (value) {
                email = value; // todo save in DB
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Password',
              ),
              onChanged: (value) {
                password = value; // todo save in DB
              },
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () async {
              try{
                final newUser = await _auth.createUserWithEmailAndPassword(email: email!, password: password!);
                if(newUser != null) {
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
              child: Center(child: Text('SignUp')),
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