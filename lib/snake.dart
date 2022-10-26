import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Snake extends StatefulWidget {
  const Snake({super.key});

  @override
  State<Snake> createState() => _SnakeState();
}

class _SnakeState extends State<Snake> {
  int linhas = 15;
  int colunas = 10;

  var comida = [4, 1];

  var cobra = [
    [0, 0],
    [0, 1]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snake Game"),
        backgroundColor: Colors.green[900],
      ),
      body: Column(children: [
        Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: linhas), // linhas
                itemCount: linhas * colunas, //colunas
                itemBuilder: (BuildContext context, int index) {
                  var cor;
                  var x = index % linhas;
                  var y = (index / linhas).floor();
                  bool corpoCobra = false;

                  for (var posicao in cobra) {
                    if (posicao[0] == x && posicao[1] == y) {
                      corpoCobra = true;
                      break;
                    }
                  }
                  if (cobra.first[0] == x && cobra.first[1] == y) {
                    cor = Colors.green;
                  } else if (corpoCobra) {
                    cor = Colors.lightGreen;
                  } else if (comida[0] == x && comida[1] == y) {
                    cor = Colors.red;
                  } else {
                    cor = Colors.grey;
                  }

                  return Container(
                    margin: const EdgeInsets.all(0.5),
                    decoration: BoxDecoration(
                      color: cor,
                      shape: BoxShape.rectangle,
                    ),
                  );
                }))
      ]),
    );
  }

  void startGame() {}
}
