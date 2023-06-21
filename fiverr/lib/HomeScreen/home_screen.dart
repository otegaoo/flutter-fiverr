import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiverr/SearchProduct/search_product.dart';
import 'package:fiverr/UploadAdScreen/upload_ad_screen.dart';
import 'package:fiverr/WelcomeScreen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../ProfileScreen/profile_screen.dart';
import '../Widgets/global_variable.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  State<HomeScreen> createState() => _HomeScreenState(); 
}

class _HomeScreenState extends State<HomeScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  getMyData()
  {
    FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .get()
    .then((results)
    {
      setState(() {
        userImageUrl = results.data()!['userImage'];
        getUserName = results.data()!['userName'];
      });
    });
  }
  
  getUserAddress() async
{
  Position newPosition = await Geolocator
    .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  position = newPosition; 

  placemarks = await placemarkFromCoordinates(
    position!.latitude,
    position!.longitude
    );

    Placemark placemark = placemarks![0];

    String newCompleteAddress = 
    '${placemark.subThoroughfare} ${placemark.thoroughfare},'
    '${placemark.subThoroughfare} ${placemark.locality},'
    '${placemark.subAdministrativeArea},'
    '${placemark.country},';
    completeAddress = newCompleteAddress;
    print(completeAddress);

    return completeAddress;

}

@override
void initState() {
  super.initState();
  getUserAddress();

  uid = FirebaseAuth.instance.currentUser!.uid;
  userEmail = FirebaseAuth.instance.currentUser!.email!;
  getMyData();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.teal],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: ()
              {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.person, color: Colors.green,),
              ),
            ),
            TextButton(
              onPressed: ()
              {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SearchProduct()));
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.search, color: Colors.orange,),
              ),
            ),
            TextButton(
              onPressed: ()
              {
                _auth.signOut().then((value){
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
                });
                
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.logout, color: Colors.green,),
              ),
            ),
          ],
          title: const Text('Home Screen',
          style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Signatra',
            fontSize: 30,
          ),
        ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.teal],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp
              )
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add Post',
          backgroundColor: Colors.black54,
          child: const Icon(Icons.cloud_upload),
          onPressed: ()
          {
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => UploadAdScreen()));
          }
          ),
      ),
    );
  }
}