import 'dart:io';

import 'equipo.dart';

class app{

   
  menuInicial(){
 
    int? opcion;
    do{
      stdout.writeln('''Elige una opción
      1 - Log in empleado
      2 - Log in cliente''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2);
    switch(opcion){
      case 1:
      // aqui sacas el menu de los empleados
      crearUsuario();
        
        break;
      case 2:
      //aqui saca el menu del cliente 
       
        break;
      default:
        print('Opción no válida');
    }

  }


  
   login() async {
    Equipo equipo = new Equipo();
    stdout.writeln('Introduce tu nombre de usuario');
    equipo.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    equipo.clave = stdin.readLineSync();
    var resultado = await equipo.loginUsuario();
    if(resultado == false){
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      menuInicial();
    } 
    
  }
    crearUsuario() async {
    Equipo equipo = new Equipo();
    stdout.writeln('Introduce un nombre de usuario');
    equipo.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una constraseña');
    equipo.clave = stdin.readLineSync();
    equipo.clave = equipo.clave;
    stdout.writeln('introduce los apellidos');
    equipo.apellidos = stdin.readLineSync();
    stdout.writeln('introduce correo electronico ');
    equipo.correo_electronico = stdin.readLineSync();
    stdout.writeln('introduce la funcion en la empresa');
    equipo.funcion = stdin.readLineSync();
    stdout.writeln('introduce tu telefono');
    equipo.telefono = stdin.readLineSync();
    stdout.writeln('introduce el rango');
    equipo.rango = stdin.readLineSync();
    await Equipo().insertarEmpleado();
    menuInicial();
  }
}
 
