import 'package:flutter/material.dart';
import 'package:vendegana/main.dart';
import 'package:vendegana/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
         WelcomeScreen(),
         SideBar()
        //MyAccount(),
        //MyOrders()
        ]
      )
    );
  }
}