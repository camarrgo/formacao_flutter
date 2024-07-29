import 'package:flutter/material.dart';
import 'package:formacao_flutter/components/task.dart';

class InicialScreen extends StatefulWidget {
  const InicialScreen({super.key});

  @override
  State<InicialScreen> createState() => _InicialScreenState();
}

class _InicialScreenState extends State<InicialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          alignment: AlignmentDirectional.centerEnd,
          child: const Icon(Icons.task),
        ),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          //nao usa o mainAxis no ListView pq so funciona em Container
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,

          //direção do scroll
          scrollDirection: Axis.vertical,

          children: const [
            Tesk(
                'Aprender Flutter',
                //'assets/image/bike.jpeg',
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
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          opacidade = !opacidade;
        });
      },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}