import 'producto.dart';
import 'database.dart';
class Venta {
  Producto producto;
  int cantidad;
  double total;

  Venta(this.producto, this.cantidad, this.total);

  Map<String, dynamic> toMap() {
    return {
      'producto': producto.modelo,
      'cantidad': cantidad,
      'total': total,
    };
  }

  insertarVenta() async {
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO ventas (producto, cantidad, total) VALUES (?,?,?)',
          [producto.modelo, cantidad, total]);
      print('Venta registrada correctamente');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}
  crearventa()async{
    Venta venta = new Venta( );  }

imprimirCajaDelDia() async {
  var conn = await Database().conexion();
  try {
    var resultado = await conn.query('SELECT * FROM ventas WHERE fecha = ()');

    double dineroTotal = 0;
    List<String> zapatillasVendidas = [];

    for (var elemento in resultado) {
      double total = double.parse(elemento['total']);
      int cantidad = int.parse(elemento['cantidad']);
      String producto = elemento['producto'];

      dineroTotal += total;
      zapatillasVendidas.add('$cantidad x $producto');
    }

    print('Caja del día:');
    print('Dinero total generado: ${dineroTotal}');
    print('Descripción de zapatillas vendidas:');
    for (var descripcion in zapatillasVendidas) {
      print(descripcion);
    }
  } catch (e) {
    print(e);
  } finally {
    await conn.close();
  }
}