import 'dart:io';
import 'dart:math';

import 'equipo.dart';
import 'producto.dart';

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
      loginusua();
       
    
        
        break;
      case 2:
      
       
        break;
      default:
        print('Opción no válida');
    }

  }
   loginusua() async {
    Equipo equipo = new Equipo();
    stdout.writeln('Introduce tu nombre de usuario');
    equipo.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    equipo.clave = stdin.readLineSync();
    var resultado = await equipo.loginUsuario();
    if(resultado == false){
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      menuInicial();
    } else {
      print('ssssssssssssssssssi');
    }
  }
 
     listarProductos()async{
    List<Producto> listadoProductos = await Producto().all();
    for(Producto elemento in listadoProductos){
      stdout.writeln(listadoProductos);
    }
  }
  
  


  
   
   
 
}