import 'package:flutter/material.dart';
import 'package:formacao_flutter/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task(
        'Jogar bola',
        'https://static.wixstatic.com/media/f5ad8a_1e6f978c5eb24dc39b583320de02149e~mv2.jpg/v1/fill/w_640,h_428,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/f5ad8a_1e6f978c5eb24dc39b583320de02149e~mv2.jpg',
        2),
    Task(
        'Jogar Video game',
        'https://www.napratica.org.br/wp-content/uploads/2017/07/destaque-videogame.jpeg',
        1),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaslInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
