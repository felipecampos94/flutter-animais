import 'package:flutter/material.dart';
import 'package:flutter_animais/pages/hello_listview.dart';

class DogPage extends StatelessWidget {
  //const DogPage({Key? key}) : super(key: key);

  final Dog dog;

  DogPage(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome),
      ),
      body: Image.asset(dog.foto),
    );
  }
}
