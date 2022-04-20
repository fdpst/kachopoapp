import 'package:flutter/material.dart';

class Proximamente extends StatelessWidget {
  const Proximamente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
        fit: BoxFit.cover, image: AssetImage('assets/images/Proximamente.png'));
  }
}
