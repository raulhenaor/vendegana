import 'package:flutter/material.dart';
import 'package:vendegana/models/productos.dart';

var futureBuilder=new FutureBuilder(
      future: makecall.firebaseCalls(databaseReference), // async work
      // ignore: top_level_function_literal_block
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none: return new Text('Press button to start');
          case ConnectionState.waiting: return new Text('Loading....');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
                return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                   return Card(
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child:  SizedBox(
                height: MediaQuery.of(context).size.height*0.15,
                       width: MediaQuery.of(context).size.width,
                       child:  Card(
                           elevation: 0,
                           child: Row(
                             children: <Widget>[
                               new Container(
                                     child: Image.network(snapshot.data[index].imgP,height: MediaQuery.of(context).size.width*0.3,width: MediaQuery.of(context).size.width*0.3,),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 10,right: 5,top: 5),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: <Widget>[
                                     new Container(
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children: <Widget>[
                                           Column(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Row(
                                                 children: <Widget>[
                                                   Image.asset('images/non_veg.png',height: 15,width: 15,),
                                                   SizedBox(width: 5),
                                                   Text(snapshot.data[index].nombre, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,fontFamily: 'Roboto-Black'),)
                                                 ],
                                               ),

                                               SizedBox(height:10.0),
                                               Row(
                                                 children: <Widget>[
                                                   new IconTheme(
                                                     data: new IconThemeData(
                                                         color: Colors.black26),
                                                     child: new Icon(Icons.timer,size: 20.0,),
                                                   ),
                                                   Text('${snapshot.data[index].precio} minutes',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black26),),
                                                 ],
                                               ),
                                             ],
                                           )
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ),

                             ],
                           )
                       )


                   ),
                ),
              );
                },
                );
        }
      },
    );