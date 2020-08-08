import 'package:firebase_database/firebase_database.dart';
import 'package:vendegana/models/productos.dart';

class MakeCall{
  List<ProductosDetailList> listItems = [];

  Future<List<ProductosDetailList>> firebaseCalls (DatabaseReference databaseReference) async{
    ProductosList productosList;
    DataSnapshot dataSnapshot = await databaseReference.once();
    Map<dynamic,dynamic> jsonResponse=dataSnapshot.value [0]['Productos'];
    productosList = new ProductosList.fromJson(jsonResponse);
    listItems.addAll(productosList.productosList);
    return listItems;
  }
}