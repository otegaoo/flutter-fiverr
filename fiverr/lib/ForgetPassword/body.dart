import 'package:fiverr/ForgetPassword/background.dart';
import 'package:flutter/material.dart';

class ForgetBody extends StatefulWidget {

  @override
  State<ForgetBody> createState() => _ForgetBodyState();
}

class _ForgetBodyState extends State<ForgetBody> {

  final TextEditingController _forgetPassTextController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ForgetBackground(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.2,),
                Text(
                  'Forget Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                    fontFamily: 'Bebas',
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  'Email address',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: _forgetPassTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black38,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}