import 'constants.dart';
import 'signin_screen.dart';
import 'package:vendegana/components/custom_buttom';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen 1',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.black87,
        textTheme: TextTheme(
          display1: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          button: TextStyle(color: kPrimaryColor),
          headline:
              TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: 
        Column(
        children: <Widget>[
          Expanded(
              child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/homeimg1.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\n\n¿QUIERES',
                        style: Theme.of(context).textTheme.display1,
                      ),
                      TextSpan(
                        text: "\nGANAR DINERO\n",
                        style: Theme.of(context).textTheme.display1,
                      ),
                      TextSpan(
                        text: "DESDE TU HOGAR?",
                        style: Theme.of(context).textTheme.display1,
                      )
                    ],
                  ),
                ),
                CustomButtom()

              ],
            ),
          ),
        ],
      ),
    ));
  }
}