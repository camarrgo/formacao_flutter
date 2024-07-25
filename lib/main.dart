import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


int pontosGeral = 0;
var gerarNumero = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          title: Text('Quem é mais rápido?'),
        ),
        body: ListView(
          //nao usa o mainAxis no ListView pq so funciona em Container
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,

          //direção do scroll
          scrollDirection: Axis.vertical,

          children: [
            Tesk(
                'Flash'),
            Tesk('A Luz'),
            Tesk('Meu Peugeot'),
            FloatingActionButton.extended(
              onPressed: () {
                print('Apertou');
                //_TeskState().aumenta();
                setState(() {
                  gerarNumero = true;
                });
              },
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.speed),
                  SizedBox(width: 5), // Espaço entre os ícones
                  Text('ACELERAR'),
                  SizedBox(width: 5),
                  Icon(Icons.car_crash),
                  SizedBox(width: 5), // Espaço entre ícone e texto

                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
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
  int allLvl = 0;
  int valordoAgeral = 0;
  int pontosSomadosTask = 0;


  int aumentaIntTask() {
    Random ram = Random();
    int aleatorio = ram.nextInt(20);
    nivel+=aleatorio;
    return nivel;
  }



  @override
  Widget build(BuildContext context) {
    //se colocar a variavel depois do @OVERRIDE ele sempre vai ficar contruindo por conta do build
    //int nivel = 0;

    if(gerarNumero){
      valordoAgeral = aumentaIntTask();
      if(valordoAgeral > 100){
        valordoAgeral = 0;
        nivel = 0;
        pontosSomadosTask++;
      }
    }


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
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                              if (nivel > 10) {
                                nivel = 0;
                              }
                              // if (valordoAgeral > 100) {
                              //   valordoAgeral = 0;
                              // }
                            });
                            print("ValorNivel: $nivel");
                            // print("valordeGeral: $valordoAgeral");
                          },
                          child: Icon(Icons.arrow_drop_up)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.red,
                          value: valordoAgeral / 100,
                        ),
                        width: 180,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Container(
                        width: 180,
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Pontos: $pontosSomadosTask e KM/h: ${valordoAgeral}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
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
