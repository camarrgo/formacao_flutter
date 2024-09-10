import 'package:flutter/material.dart';
import 'package:formacao_flutter/components/task.dart';
import 'package:formacao_flutter/data/task_inherited.dart';
import 'package:formacao_flutter/screens/form_screen.dart';

class InicialScreen extends StatefulWidget {
  const InicialScreen({super.key});

  @override
  State<InicialScreen> createState() => _InicialScreenState();
}

class _InicialScreenState extends State<InicialScreen> {
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
      body: ListView(
        //nao usa o mainAxis no ListView pq so funciona em Container
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,

        //direção do scroll
        scrollDirection: Axis.vertical,

        children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(top: 8, bottom: 70),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context,),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
