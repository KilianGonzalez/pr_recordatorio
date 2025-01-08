import 'package:flutter/material.dart';

class ItemTarea extends StatelessWidget {
  final String textotarea;
  final bool valorCheckbox;

  const ItemTarea({
    super.key,
    required this.textotarea,
    required this.valorCheckbox,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
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
                onChanged: (valorrRecibido) {},
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
    );
  }
}
