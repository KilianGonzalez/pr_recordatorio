import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTarea extends StatelessWidget {
  final String textotarea;
  final bool valorCheckbox;
  final Function(bool?)? cambiaValorCheckbox;
  final Function(BuildContext)? borrarTarea;

  const ItemTarea({
    super.key,
    required this.textotarea,
    required this.valorCheckbox,
    required this.cambiaValorCheckbox,
    required this.borrarTarea,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              onPressed: borrarTarea,
            ),
          ]
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // Checkbox
                Checkbox(
                  activeColor: Colors.teal[200],
                  checkColor: Colors.green[800],
                  side: BorderSide(
                    color: Colors.green[800]!,
                    width: 2,
                  ),
                  value: valorCheckbox,
                  onChanged: cambiaValorCheckbox,
                ),
            
                //Texto
                Text(
                  textotarea,
                  style: TextStyle(
                    color: Colors.green[800],
                    decoration: valorCheckbox ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationColor: Colors.red,
                    decorationThickness: 4, 
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
