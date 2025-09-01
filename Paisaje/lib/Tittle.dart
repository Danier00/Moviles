import 'package:flutter/material.dart';

class Tittle extends StatelessWidget {
  const Tittle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            Text(
              'Cascada en un entorno natural',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 50, top: 30),
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.star, color: Colors.red),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, top: 30),
                  child: Text(
                    '4.5',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Paisaje natural de aguas cristalinas',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
