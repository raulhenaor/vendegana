import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/body.dart';

FocusNode myFocusNode = new FocusNode();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool isSearching = false;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('$size');
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blue,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        isSearching == false
            ?
            //CODIGO FUNCIONANADO PRUEBA
            Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: TextField(
                    enabled: !isSearching,
                    onTap: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                    focusNode: myFocusNode,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Buscar producto',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
/*                 suffixIcon: Icon(
                  Icons.cancel,
                  size: 20,
                  color: Colors.blueAccent,
                ), */
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ))
            :

//CODIGO FUNCIONANDO PRUEBA

            Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: TextFormField(
                    focusNode: myFocusNode,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Escribe el producto',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
/*                 suffixIcon: Icon(
                  Icons.cancel,
                  size: 20,
                  color: Colors.blueAccent,
                ), */
                      prefixIcon: IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 20,
                        color: Colors.blueAccent,
                        onPressed: () {
                          setState(() {
                            isSearching = false;
                          });
                        },
                      ),
                    ),
                  ),
                ))
      ],
    );
    /* actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Container(
            width: 350,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                
                hintText: 'Buscar producto',
                labelStyle: TextStyle(
                  fontSize: 20,
                ),
                

                suffixIcon: Icon(
                  Icons.cancel,
                  size: 20,
                  color: Colors.blueAccent,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.blueAccent,
                ),

                
              ),
            ),
          ),
        ),
      ], */
  }
}

/* appBar: AppBar(
        backgroundColor: Colors.pink,
        title: !isSearching
            ? Text('All Countries')
            : TextField(
                onChanged: (value) {
                  _filterCountries(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search Country Here",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      filteredCountries = countries;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ), */
