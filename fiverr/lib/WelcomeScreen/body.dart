import 'package:fiverr/SignupScreen/signup_screen.dart';
import 'package:fiverr/WelcomeScreen/background.dart';
import 'package:fiverr/Widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../LoginScreen/login_screen.dart';

class WelcomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WelcomeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'OLX Clone',
              style: TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontFamily: 'Signatra',
                ),
              ),
              SizedBox(height: size.height * 0.05,),
              Image.asset('assets/icons/chat.png',
              height: size.height * 0.40,
              ),
              RoundedButton(
                text: 'LOGIN',
                press: ()
                {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              RoundedButton(
                text: 'SIGN UP',
                color: Colors.black54,
                textColor: Colors.white,
                press: ()
                {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignupScreen()));
                },
              ),
            ],
          ),
      ),);
  }
}