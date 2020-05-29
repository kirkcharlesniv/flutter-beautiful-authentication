import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:springboard/screens/intro_screen.dart';

class Home extends StatefulWidget {
  final String uid;
  const Home({Key key, this.uid}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: Firestore.instance
                  .collection('users')
                  .document(widget.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                nameController.text = snapshot.data['name'];
                return Column(
                  children: <Widget>[
                    Text(
                      snapshot.data['name'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter your email address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(hintText: 'Name'),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Firestore.instance
                                    .collection('users')
                                    .document(widget.uid)
                                    .updateData({"name": nameController.text});
                              }
                            },
                            child: Text(
                              'Change Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
