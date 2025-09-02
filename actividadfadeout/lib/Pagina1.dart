import 'package:actividadfadeout/Pagina2.dart';
import 'package:flutter/material.dart';

class ImagenHero extends StatefulWidget {
  const ImagenHero({super.key});

  @override
  State<ImagenHero> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ImagenHero> {
  @override
Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            child: Hero(
              tag: 'imagen-hero',
              child: Image.asset('assets/images/imagen.webp',width: 90,height: 90),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ImagenFadeOut()));
            },
          ),  
        ),
      ),
    );
  }
}