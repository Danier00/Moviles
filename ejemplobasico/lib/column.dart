import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Center(
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 104, 119, 255),
          actions: [
            Text("Appbar"),
            
          ],
        ),
      )
    );
  }
}