import 'package:flutter/material.dart';
import 'package:pr_recordatorio/componentes/item_tarea.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {

  List tareasLista = [
    {"titulo": "Tarea 1", "valor": false},
    {"titulo": "Tarea 2", "valor": true},
    {"titulo": "Tarea 3", "valor": true},
  ];

  void cambiaCheckbox(bool v_checkbox, int posLista) {
    setState(() {
      tareasLista[posLista]["valor"] = !tareasLista[posLista]["valor"];
    });
  }

  void accionBorrarTarea(int posLista) {
    setState(() {
      tareasLista.removeAt(posLista);
    });
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
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.green[800]),
      ),

      // Body
      body: ListView.builder(
        itemCount: tareasLista.length,
        itemBuilder: (context, index) {
          return ItemTarea(
            textotarea: tareasLista[index]["titulo"],
            valorCheckbox: tareasLista[index]["valor"],
            cambiaValorCheckbox: (v_checkbox) => cambiaCheckbox(
              tareasLista[index]["valor"],
              index,
            ),
            borrarTarea: (valor) => accionBorrarTarea(index),
          );
        },
      ),
    );
  }
}