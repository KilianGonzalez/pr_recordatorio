import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pr_recordatorio/componentes/dialog_nueva_tarea.dart';
import 'package:pr_recordatorio/componentes/item_tarea.dart';
import 'package:pr_recordatorio/data/bbdd.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {

  /*List tareasLista = [
    {"titulo": "Tarea 1", "valor": false},
    {"titulo": "Tarea 2", "valor": true},
    {"titulo": "Tarea 3", "valor": true},
  ];*/

  final Box _boxHive = Hive.box("box_tareas_app");
  Bbdd db = Bbdd();

  TextEditingController tecTextoTarea = TextEditingController();

  void accionGuardar() {
    setState(() {
      db.tareasLista.add({"titulo" : tecTextoTarea.text, "valor" : false});
    });
    db.actualizarDatos();
  }

  void accionCancelar() {
    Navigator.of(context).pop();
    tecTextoTarea.clear();
  }

  void cambiaCheckbox(bool v_checkbox, int posLista) {
    setState(() {
      db.tareasLista[posLista]["valor"] = !db.tareasLista[posLista]["valor"];
    });
    db.actualizarDatos();
  }

  void accionBorrarTarea(int posLista) {
    setState(() {
      db.tareasLista.removeAt(posLista);
    });
    db.actualizarDatos();
  }

  void crearNuevaTarea() {
    showDialog(
      context: context, 
      builder: (context){
        return DialogNuevaTarea(
          tecTextoTarea: tecTextoTarea,
          accionGuardar: accionGuardar,
          accionCancelar: accionCancelar,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],

      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text("App Tareas"),
        foregroundColor: Colors.green[800],
      ),

      // FloatingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        shape: const CircleBorder(),
        onPressed: crearNuevaTarea,
        child: Icon(Icons.add, color: Colors.green[800]),
      ),

      // Body
      body: ListView.builder(
        itemCount: db.tareasLista.length,
        itemBuilder: (context, index) {
          return ItemTarea(
            textotarea: db.tareasLista[index]["titulo"],
            valorCheckbox: db.tareasLista[index]["valor"],
            cambiaValorCheckbox: (v_checkbox) => cambiaCheckbox(
              db.tareasLista[index]["valor"],
              index,
            ),
            borrarTarea: (valor) => accionBorrarTarea(index),
          );
        },
      ),
    );
  }
}