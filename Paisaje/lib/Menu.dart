import 'package:flutter/material.dart';

class Menu extends StatelessWidget implements PreferredSizeWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text('Flutter layout demo'),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
