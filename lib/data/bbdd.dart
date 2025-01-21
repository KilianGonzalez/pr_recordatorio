import 'package:hive/hive.dart';

class Bbdd {
  List tareasLista = [];

  final Box _boxdelaHive = Hive.box("box_tareas_app");

  void cargarDatos() {
    tareasLista = _boxdelaHive.get("box_tareas_app");
  }

  void actualizarDatos() {
    _boxdelaHive.put("box_tareas_app", tareasLista);
  }

  void crearDatosEj() {
    tareasLista = [
      {"titulo": "Tarea 1", "valor": false},
      {"titulo": "Tarea 2", "valor": true},
      {"titulo": "Tarea 3", "valor": true},
    ];
  }
}