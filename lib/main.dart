

import 'package:vendegana/sidebar/sidebar_layourt.dart';

import 'bloc.navigation_bloc/navigation_bloc.dart';
import 'components/custom_animation.dart';
import 'constants.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen 1',
      debugShowCheckedModeBanner: false,
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
      home: SideBarLayout(),
      
      
    );
  }
}

class WelcomeScreen extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child:  
        Column(
        children: <Widget>[
          Expanded(

            child: Container(
              padding: EdgeInsets.only(top: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/homeimg1.jpg"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35) 
                )
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
                  child: CustomAnimation(
                        label: "Continuar",
                        background: Colors.amber,
                        borderColor: Colors.white,
                        fontColor: Colors.white,
                       
                    
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    )
    );
  }
}
