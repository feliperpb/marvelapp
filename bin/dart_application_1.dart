 import 'database.dart';
 import 'equipo.dart';
 import 'app.dart';
main()async {
  Database().instalacion();
  app().crearUsuario();
}