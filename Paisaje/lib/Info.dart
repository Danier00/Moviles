import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Text(
        'Una cascada de aguas cristalinas cae suavemente sobre un estanque rodeado de abundante vegetación verde. El entorno transmite frescura, serenidad y conexión con la naturaleza, invitando a la calma y la contemplación.',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }
}
