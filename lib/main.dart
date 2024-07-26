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
                'Aprender Flutter',
                'https://cdn-images-1.medium.com/v2/resize:fit:1200/1*5-aoK8IBmXve5whBQM90GA.png',
                3),
            Tesk(
                'Andar de bike',
                'https://media.unimedcampinas.com.br/b9fa3254-5c4d-4f60-b3f9-e1a1dbbfa5e4',
                1),
            Tesk(
                'Meditar',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUqDS-0-oReeghWnA7aL5W3nsonIH3N3wHaA&s',
                5),
            Tesk(
                'Jogar bola',
                'https://static.wixstatic.com/media/f5ad8a_1e6f978c5eb24dc39b583320de02149e~mv2.jpg/v1/fill/w_640,h_428,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/f5ad8a_1e6f978c5eb24dc39b583320de02149e~mv2.jpg',
                2),
            Tesk(
                'Jogar Video game',
                'https://www.napratica.org.br/wp-content/uploads/2017/07/destaque-videogame.jpeg',
                1),
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
  final String foto;
  final int dificuldade;

  Tesk(this.nome, this.foto, this.dificuldade);

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
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              //color: Colors.blue,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 1)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 2)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 3)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 4)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 5)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                              if (nivel > widget.dificuldade * 10) {
                                nivel = 0;
                              }
                            });
                            print(nivel);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.white,
                              ),
                              Text(
                                'UP',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(4), // Sem bordas arredondadas
                            ),
                            padding: EdgeInsets.all(0),
                            backgroundColor: Colors
                                .blue, // Ajuste o padding conforme necessário
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
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
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
