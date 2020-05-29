import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Springboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
      ),
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final _formKey = GlobalKey<FormState>();
  bool isDismissing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );
    _controller.forward();
    isDismissing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: FlareActor(
              "assets/animations/springboard_login.flr",
              animation: isDismissing ? "reverse" : "forward",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Springboard',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 32),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.425),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Email'),
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Password'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 34),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Color(0xff3D404A), Color(0xff545C67)],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () => print('Sign Up'),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () => print('Forgot Password'),
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
