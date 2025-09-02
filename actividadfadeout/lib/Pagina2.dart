import 'package:flutter/material.dart';

class ImagenFadeOut extends StatefulWidget {
  const ImagenFadeOut ({super.key});

  @override
  State<ImagenFadeOut > createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ImagenFadeOut > {
  bool mostrartexto = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Hero(
                tag: 'imagen-hero',
                child: Image.asset('assets/images/imagen.webp'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  mostrartexto = !mostrartexto;
                });
              },
              child: const Text('Mostrar texto'),
            ),
            if (mostrartexto)
              Text('Texto mostrado'),
          ],
        ),
      ),
    );
  }
}