import 'package:fiverr/LoginScreen/background.dart';
import 'package:fiverr/SignupScreen/signup_screen.dart';
import 'package:fiverr/Widgets/already_have_an_account_check.dart';
import 'package:fiverr/Widgets/rounded_button.dart';
import 'package:fiverr/Widgets/rounded_input_field.dart';
import 'package:fiverr/Widgets/rounded_password_field.dart';
import 'package:flutter/material.dart';

import '../ForgetPassword/forget_password.dart';

class LoginBody extends StatefulWidget {

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.04,),
            Image.asset('assets/icons/login.png',
            height: size.height * 0.32,
            ),
            SizedBox(height: size.height * 0.03,),
            RoundedInputField(
              hintText: 'Email',
              icon: Icons.person,
              onChanged: (value)
              {
                  _emailController.text = value;
                },
              ),
              const SizedBox(height: 6,),
              RoundedPasswordField(
                onChanged: (value) {
                  _passwordController.text = value;
                },
              ),
              const SizedBox(height: 8,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgetPassword()));
                  },
                  child: const Text(
                    'Forget Password? ',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,)
                  ),
                ),
              ),
              RoundedButton(
                text: 'LOGIN',
                press: () {

                },
              ),
              SizedBox(height: size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(
                login: true,
                press: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupScreen()));
                },
              ),
          ]
        ),
      )
    );
  }
}