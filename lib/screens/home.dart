import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:springboard/screens/intro_screen.dart';

class Home extends StatelessWidget {
  final String uid;
  const Home({Key key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => IntroScreen()),
                );
              });
            },
          )
        ],
      ),
      body: Container(
        child: Center(child: Text(uid)),
      ),
    );
  }
}
