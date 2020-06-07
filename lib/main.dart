import 'constants.dart';
import 'signin_screen.dart';
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
          display1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/homeimg1.jpg"),
                  fit: BoxFit.cover,
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
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignInScreen();
                        },
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 25),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amber,
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 0),
                          Text(
                            "Continuar",
                            style: Theme.of(context).textTheme.button.copyWith(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                          ),
                          
                          
                        ],
                      ),
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