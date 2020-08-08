import 'package:firebase_database/firebase_database.dart';


final databaseReference = FirebaseDatabase.instance.reference();
class ProductosDetailList {
  String nombre;
  String categorias;
  String descripcion;
  String codProveedor;
  String imgUno;
  String imgDos;
  String imgTres;
  String imgCuatro;
  String imgP;
  String precio;
  String precioOferta;

ProductosDetailList({this.nombre,this.categorias,this.descripcion,this.codProveedor,this.imgUno,this.imgDos,this.imgTres,this.imgCuatro,
               this.imgP,this.precio,this.precioOferta});

factory ProductosDetailList.fromJson(Map<dynamic,dynamic> parsedJson){
  return ProductosDetailList(nombre: parsedJson['nombre'], categorias: parsedJson['categoria'], descripcion: parsedJson['descripcion'],
                             codProveedor: parsedJson['cod_proveedor'], imgUno: parsedJson['imagen_1'], imgDos: parsedJson['imagen_2'],
                             imgTres: parsedJson['imagen_3'], imgCuatro: parsedJson['imagen_4'], imgP: parsedJson['imagen_p']);
}

}

class ProductosList{
  List<ProductosDetailList> productosList;
  ProductosList({this.productosList});
  factory ProductosList.fromJson(Map<dynamic,dynamic> json){
    return ProductosList(productosList: parseproductos(json));
      }
    
      
}

parseproductos(Map json) {
        // ignore: unused_element
        List<ProductosDetailList> parseproductos(productosJSON){
          var rList=productosJSON['Productos'] as List;
          List<ProductosDetailList> productosList=rList.map((data) => ProductosDetailList.fromJson(data));
          return productosList;
        }
      }