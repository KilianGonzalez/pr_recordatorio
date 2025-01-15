import 'package:flutter/material.dart';
import 'package:pr_recordatorio/componentes/boton_dialog.dart';

class DialogNuevaTarea extends StatelessWidget {
  final TextEditingController tecTextoTarea;
  final Function()? accionGuardar;
  final Function()? accionCancelar ;

  const DialogNuevaTarea({
      super.key,
      required this.tecTextoTarea,
      required this.accionGuardar,
      required this.accionCancelar,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: tecTextoTarea,
              cursorColor: Colors.orange[300],
              decoration: InputDecoration(
                hintText: "Escribe la tarea...",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.teal[100],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BotonDialog(t_boton: "Guardar", accionBoton: accionGuardar),
                BotonDialog(t_boton: "Cancelar", accionBoton: accionCancelar),
              ],
            ),
          ],
        ),
      ),
    );
  }
}