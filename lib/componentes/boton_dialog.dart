import 'package:flutter/material.dart';

class BotonDialog extends StatelessWidget {

  final String t_boton;
  final Function()? accionBoton;

  const BotonDialog({
    super.key,
    required this.t_boton,
    required this.accionBoton,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: accionBoton,
      color: Colors.teal[200],
      child: Text(t_boton),  
    );
  }
}