import 'package:flutter/material.dart';
import 'package:vendegana/propComponents/constructorFuturo.dart';



class ItemsCards extends StatefulWidget {
  
  ItemsCards({Key key}) : super(key: key);

  @override
  _ItemsCardsState createState() => _ItemsCardsState();
}

class _ItemsCardsState extends State<ItemsCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: futureBuilder,
    );
  }
}
