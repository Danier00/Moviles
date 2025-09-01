import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Column(
                children: [
                  Icon(Icons.phone, color: Colors.purple),
                  Text(
                    'CALL',
                    style: TextStyle(color: Colors.purple, fontSize: 10),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Icon(Icons.near_me, color: Colors.purple),
                Text(
                  'ROUTE',
                  style: TextStyle(color: Colors.purple, fontSize: 10),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.only(right: 40),
              child: Column(
                children: [
                  Icon(Icons.share, color: Colors.purple),
                  Text(
                    'SHARE',
                    style: TextStyle(color: Colors.purple, fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
