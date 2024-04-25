import 'database.dart';



class producto{
String? _tipo_calzado;
int? _talla;
String? _color;
double? _precio;



 insertarProducto() async {
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO productos (tipo_calzado, talla, color, precio ) VALUES (?,?,?,? )',
          [ _tipo_calzado, _talla, _color, _precio]);
      print('Usuario insertado correctamente');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }


}




}