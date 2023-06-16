import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiverr/LoginScreen/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  State<HomeScreen> createState() => _HomeScreenState(); 
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),
      leading: GestureDetector(
        onTap: ()
        {
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: const Icon(
          Icons.logout,
          )
      ),
      ),
    );
  }
}