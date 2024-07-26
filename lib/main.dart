import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int valorBandeira = 0;

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
          title: Text('Tarefas'),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Tesk('Pressione o\nbotão', Colors.white, '', 0, '', ''),
                Tesk(
                    'Athletico PR',
                    Colors.red,
                    'Primeira Divisão',
                    1,
                    'https://upload.wikimedia.org/wikipedia/pt/c/c7/Club_Athletico_Paranaense_2019.png',
                    'https://cassiozirpoli.com.br/wp-content/uploads/2018/12/2018_atletico_pr_x_junior_barranquilla_copa_sul_americana_final_800_3.jpg'),
                Tesk('Coritiba', Colors.green, 'Segunda Divisão', 2, 'https://s2-ge.glbimg.com/o0A8-c_bNI-CUM4HhJ8hvNLFywA=/0x0:356x480/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2017/B/l/XRo7SnTjGnWKr6BUCWXQ/memes.jpg', 'https://media.gazetadopovo.com.br/2009/12/5887c144a741813d0907d6722cb394ae-gpMedium.jpg'),
                Tesk('Parana Club', Colors.blue, 'Terceira Divisão', 3, 'https://upload.wikimedia.org/wikipedia/pt/0/07/Parana_Clube.png', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhhk2ZVOaK5OpsCpkfhCeF_BVuABS-ofbWfCn19vvUlS_oszOM2DcqTyWxCJgwsBpUiqsSdzAyx1JeWa_Lh3uIznVqUMQe4LjySQn9PKkwwJx-Ueepe8OJYMeKzD_cXZZTWpMWoo-UQe3_2/s1600/kombi.jpg'),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                //   children: [
                //     FloatingActionButton.extended(
                //       onPressed: () {
                //         print('TRocou de time: $valorBandeira');
                //         //_TeskState().aumenta();
                //         setState(() {
                //           trocaTime();
                //         });
                //       },
                //       label: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           Icon(Icons.flag),
                //           SizedBox(width: 5), // Espaço entre os ícones
                //           Text('TROCAR O TIME'),
                //           SizedBox(width: 5),
                //           Icon(Icons.flag),
                //           SizedBox(width: 5), // Espaço entre ícone e texto
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
            onPressed: () {
              print('TRocou de time: $valorBandeira');
              //_TeskState().aumenta();
              setState(() {
                trocaTime();
              });
            },
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.flag),
                SizedBox(width: 5), // Espaço entre os ícones
                Text('TROCAR O TIME'),
                SizedBox(width: 5),
                Icon(Icons.flag),
                SizedBox(width: 5), // Espaço entre ícone e texto
              ],
            ),
          ),
        ),
      ),
    );
  }
}

trocaTime() {
  Random trocar = Random();
  valorBandeira = trocar.nextInt(3) + 1;
  //return valorBandeira = trocar.nextInt(3)+1;
}

//Tesk é tarefa em pt kk qualquer nome
class Tesk extends StatefulWidget {
  final String nome;
  Color bandeira;
  final String divisao;
  final int ordem;
  final String imagemDoTime;
  final String backImagemDoTime;

  Tesk(this.nome, this.bandeira, this.divisao, this.ordem, this.imagemDoTime,
      this.backImagemDoTime);

  @override
  State<Tesk> createState() => _TeskState();
}

class _TeskState extends State<Tesk> {
  int nivel = 1;

  @override
  Widget build(BuildContext context) {
    if (widget.ordem == valorBandeira) {
      if (valorBandeira == 0) {
        widget.bandeira = Colors.black;
      }
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    width: 1920,
                    height: 200,
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                            color: Colors.white,
                            child: Image.network(widget.imagemDoTime)),
                        // child: Text(
                        //   widget.nome,
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 25,
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: widget.bandeira,
                    ),
                    width: 150,
                    height: 100,
                    child: Text(
                      widget.divisao,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 1920,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.network(widget.backImagemDoTime, fit: BoxFit.cover,),

                        ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
