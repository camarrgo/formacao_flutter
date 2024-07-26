import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            alignment: AlignmentDirectional.centerEnd,
            child: Icon(Icons.task),
          ),
          title: Text('Tarefas'),
        ),
        body: ListView(
          //nao usa o mainAxis no ListView pq so funciona em Container
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,

          //direção do scroll
          scrollDirection: Axis.vertical,

          children: [
            Tesk(
                'Aprender Flutter no cafe da manha comendo churrasco adasd asdasd asdas das dasd asda sd'),
            Tesk('Andar de bike'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
            Tesk('Meditar'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          print('Apertou');
        }),
      ),
    );
  }
}

//Tesk é tarefa em pt kk qualquer nome
class Tesk extends StatefulWidget {
  final String nome;

  Tesk(this.nome);

  @override
  State<Tesk> createState() => _TeskState();
}

class _TeskState extends State<Tesk> {
  // const Tesk(this.nome,{super.key});

  //a varaivel foi colocada antes do override assim ele nao vai ficar setando toda vez o valor
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    //se colocar a variavel depois do @OVERRIDE ele sempre vai ficar contruindo por conta do build
    //int nivel = 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black26,
                        width: 72,
                        height: 100,
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          widget.nome,
                          style: TextStyle(
                              fontSize: 24, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                              if (nivel > 10) {
                                nivel = 0;
                              }
                            });
                            print(nivel);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.zero, // Sem bordas arredondadas
                            ),
                            padding: EdgeInsets.all(
                                0), // Ajuste o padding conforme necessário
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.red,
                          value: nivel / 10,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nível: $nivel',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
