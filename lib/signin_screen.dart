import 'constants.dart';
import 'package:flutter/material.dart';


import 'main.dart';

class SignInScreen extends StatefulWidget {

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  

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
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: <Widget>[
                      Text(                        
                        "INICIAR SESIÓN",                        
                        style: Theme.of(context).textTheme.display1,
                      ),
                      Text(
                        "REGISTRARSE",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.phone,
                            color: kPrimaryColor,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Ingrese número de Celular",
                            ),
                            onChanged: (val) {    
                                                        
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  FittedBox(
                    child: GestureDetector (
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                        return WelcomeScreen();
                        },
                        ));
                      },
                      child: Container (
                        margin: EdgeInsets.only(bottom:50),
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.amber,
                        ),
                        child: Row (
                          children: <Widget>[
                            Text(
                              'Validar',
                              style: Theme.of(context).textTheme.button.copyWith(
                                color: Colors.white,
                                fontSize: 20,
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
          ),
        ],
      ),
    );

    
  }

  
}



