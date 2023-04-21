import 'package:flutter/material.dart';
import 'package:jivan/LoginPage/login_screen.dart';
import 'package:jivan/LoginPage/signup_screen.dart';
import 'package:jivan/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jivan says welcome!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 3,
            child: Center(
              child: Text(
                  '''
              Hello, my name is Rishi and I have create this app as apart of my computer science NEA. Come join me on this magical adventure as we communicate with your devices through the use of my amazing app!
              ''',
              textAlign: TextAlign.center,),
            ),
          ),
          Expanded(child: Column(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
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
          ],)),
        ],
      ),
    );
  }
}
