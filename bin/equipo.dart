import 'dart:io';
import 'package:mysql1/mysql1.dart';
import 'database.dart';

class equipo{

  String? _nombre;
  String? _apellidos;
  String? _funcion;
  String? _telefono;
  String? _correo_electronico;
 
 
  String? get nombre => this._nombre;

    set nombre(String? value) => this._nombre = value;
  String? get apellidos => this._apellidos;

    set apellidos(String? value) => this._apellidos = value;

  String? get funcion => this._funcion;

    set funcion(String? value) => this._funcion = value;

  String? get telefono => this._telefono;

    set telefono(String? value) => this._telefono = value;

  String? get correo_electronico => this._correo_electronico;

    set correo_electronico(String? value) => this._correo_electronico = value;
  equipo();

  equipo.fromMap(ResultRow map) {
    this._nombre = map['nombre'];
    this._apellidos = map['apellidos'];
    this._telefono = map['telefono'];
    this._funcion = map['funcion'];
    this._correo_electronico = map['correo_electronico'];
  }

  insertarEmpleado() async {
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO equipo (nombre, apellidos, correo_electronico, _funcion, _telefono) VALUES (?,?,?,?,?)',
          [_nombre, _apellidos, _correo_electronico,_funcion, _telefono]);
      print('Usuario insertado correctamente');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }


}
  sacarempleado() async {
    var conn = await Database().conexion();

    try {
      var resultado = await conn.query('SELECT * FROM equipo');
      List<equipo> equipos =
          resultado.map((row) => equipo.fromMap(row)).toList();
      return equipos;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}