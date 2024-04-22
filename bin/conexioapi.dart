import 'package:mysql1/mysql1.dart';
 main() {
  
}

class Database {
  // Propiedades
  final String _host = 'localhost';
  final int _port = 3306;
  final String _user = 'root';

  // Métodos
  instalacion() async {
    var settings = ConnectionSettings(
      host: this._host, 
      port: this._port,
      user: this._user,
    );
    var conn = await MySqlConnection.connect(settings);
    try{
      await _crearDB(conn);
      await _crearTablaproductos(conn);
      await _crearTablainventario(conn);
      await _crearTablapedidos(conn);
      await conn.close();
    } catch(e){
      print(e);
      await conn.close();
    } 
  }

  Future<MySqlConnection> conexion() async {
    var settings = ConnectionSettings(
      host: this._host, 
      port: this._port,
      user: this._user,
      db: 'tiendazapas'
    );
      
    return await MySqlConnection.connect(settings);
 
  }
  
  _crearDB (conn) async {
    await conn.query('CREATE DATABASE IF NOT EXISTS tiendazapas');
    await conn.query('USE tiendazapas');
    print('Conectado a tiendazapas');
  }

  _crearTablaproductos(conn) async {
    await conn.query(''' CREATE TABLE IF NOT EXISTS productos(
      id_producto INT PRIMARY KEY AUTO_INCREMENT,
      tipo_calzado VARCHAR(50) NOT NULL,
      talla VARCHAR(10) NOT NULL,
      color VARCHAR(20) NOT NULL,
      precio DECIMAL(10,2) NOT NULL,
      )''');
    print('Tabla productos creada');
  }

  _crearTablainventario(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS inventario(
      id INT PRIMARY KEY AUTO_INCREMENT,
      id_producto INT,
      cantidad_stock INT,
      ubicacion_almacen VARCHAR(50)
      )''');
    print('Tabla inventario creada');
  }
   _crearTablapedidos(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS pedidos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      id_producto INT,
      cantidad_stock INT,
      ubicacion_almacen VARCHAR(50)
      )''');
    print('Tabla pedidos creada');
  }
   _crearTablaclientes(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS clientes(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    codigo_postal VARCHAR(10),
    telefono VARCHAR(15),
    correo_electronico VARCHAR(50),
    fecha_nacimiento DATE
      )''');
    print('Tabla clientes creada');
  }
   _crearTablaproveedores(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS proveedor(
     id_proveedorNT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    contacto VARCHAR(50),
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    codigo_postal VARCHAR(10),
    telefono VARCHAR(15),
    correo_electronico VARCHAR(50)
      )''');
    print('Tabla inventario creada');
  }
   _crearTablainventario(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS mascotas(
      id INT PRIMARY KEY AUTO_INCREMENT,
      id_producto INT,
      cantidad_stock INT,
      ubicacion_almacen VARCHAR(50)
      )''');
    print('Tabla inventario creada');
  }
   _crearTablainventario(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS mascotas(
      id INT PRIMARY KEY AUTO_INCREMENT,
      id_producto INT,
      cantidad_stock INT,
      ubicacion_almacen VARCHAR(50)
      )''');
    print('Tabla inventario creada');
  }
}