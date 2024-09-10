//Tesk é tarefa em pt kk qualquer nome
import 'package:flutter/material.dart';
import 'package:formacao_flutter/components/Difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {super.key});

  int lvl = 0;

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  // const Tesk(this.nome,{super.key});

  //a varaivel foi colocada antes do override assim ele nao vai ficar setando toda vez o valor

  // Definindo um mapa de cores personalizadas
  static const List<Color> customColors = [
    //cores inspiradas no judo
    Colors.white,
    Colors.grey,
    Colors.blue,
    Color(0xFF0000FF), //azul escuro
    Colors.yellow,
    Colors.orange,
    Colors.green,
    Colors.deepPurple,
    Colors.brown,
    Colors.black,
  ];



  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

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
                color: customColors[widget.lvl],
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
                          //child: Image.asset(
                          child: assetOrNetwork()
                              ? Image.asset(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Difficulty(widget: widget),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        width: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                              if (widget.nivel > widget.dificuldade * 10) {
                                // aqui mudar a cor
                                if (widget.lvl < 9) {
                                  widget.lvl++;
                                  widget.nivel = 0;
                                }
                                //print("valor do LVL= $lvl");
                              }
                            });
                            //print(nivel);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  4), // Sem bordas arredondadas
                            ),
                            padding: const EdgeInsets.all(0),
                            backgroundColor: Colors
                                .blue, // Ajuste o padding conforme necessário
                          ),
                          child: const Column(
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
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.red,
                          value: (widget.dificuldade > 0)
                              ? (widget.nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nível: ${widget.nivel}',
                        style: widget.lvl > 0
                            ? const TextStyle(color: Colors.white, fontSize: 16)
                            : const TextStyle(
                                color: Colors.black, fontSize: 16),
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
