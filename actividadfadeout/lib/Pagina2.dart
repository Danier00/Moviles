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
            Hero(
              tag: 'imagen-hero',
              child: Image.asset('assets/images/imagen.webp'),
            ),
             AnimatedOpacity(
                opacity: mostrartexto ? 1.0 : 0.0,
                duration: const Duration(seconds: 4),
                child: Text(
                  'Este es el texto que aparece con efecto fade-in al presionar el botón.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
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
             
          ],
        ),
      ),
    );
  }
}