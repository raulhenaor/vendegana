import 'package:flutter/material.dart';
import 'package:vendegana/bloc.navigation_bloc/navigation_bloc.dart';

class SettingsPage extends StatelessWidget with NavigationStates {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Ajustes",
      style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28))
    );
  }
}