import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello, world!'),
          SizedBox(height: 20),
          Text('Lucas Robaert Pereira'),
          Text('Email: lucasrobaert@hotmail.com.br'),
          Text('Telefone: (61) 996854-641')
        ],
      ))),
    );
  }
}
