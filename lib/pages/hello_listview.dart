// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animais/pages/dog_page.dart';
import 'package:flutter_animais/utils/nav.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  State<HelloListView> createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  //const HelloListView({Key? key}) : super(key: key);
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                _gridView = true;
              });
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Jack", "assets/images/dog1.png"),
      Dog("Puma", "assets/images/dog2.png"),
      Dog("Tigre", "assets/images/dog3.png"),
      Dog("Thor", "assets/images/dog4.png"),
      Dog("Laika", "assets/images/dog5.jpg"),
      Dog("Urso", "assets/images/dog6.webp"),
    ];

    if (_gridView) {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 350,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];

    return GestureDetector(
      onTap: () {
        push(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
              child: Text(
                dog.nome,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
