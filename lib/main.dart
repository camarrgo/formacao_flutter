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
        body: Container(
          child: Stack(
            children: [
              Tesk('Escolha um time', Colors.white, '', 0),
              Tesk('Athletico PR', Colors.red, 'Primeira Divisão', 1),
              Tesk('Coritiba', Colors.green, 'Segunda Divisão', 2),
              Tesk('Parana Club', Colors.blue, 'Terceira Divisão', 3),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FloatingActionButton.extended(

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
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          print('Apertou');
        }),
      ),
    );
  }
}

trocaTime(){
  Random trocar = Random();
  valorBandeira = trocar.nextInt(3)+1;
  //return valorBandeira = trocar.nextInt(3)+1;
}

//Tesk é tarefa em pt kk qualquer nome
class Tesk extends StatefulWidget {
  final String nome;
  Color bandeira;
  final String divizao;
  final int ordem;

  Tesk(this.nome, this.bandeira, this.divizao, this.ordem);

  @override
  State<Tesk> createState() => _TeskState();
}

class _TeskState extends State<Tesk> {

  int nivel = 1;

  @override
  Widget build(BuildContext context) {




    if(widget.ordem == valorBandeira){
      if(valorBandeira == 0){
        widget.bandeira = Colors.black;
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: widget.bandeira,
                    width: 150,
                    height: 150,
                    child: Text(
                      widget.nome,

                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: widget.bandeira,
                    width: 150,
                    height: 50,
                    child: Text(
                      widget.divizao,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }else{
      return Container();
    }


  }
}
