import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier{
   final List<Task> _tasks=[
    Task(name: 'Get dressed'),
  ];

   UnmodifiableListView<Task> get tasks{
     return UnmodifiableListView(_tasks);
}

  void addTask(String newTask){
    final task =Task(name: newTask);
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask(bool value,int index){
     _tasks[index].toggleDone();
     notifyListeners();
  }

  void deleteTask(int index){
     _tasks.remove(_tasks[index]);
     notifyListeners();
  }

  int get taskCount{
    return _tasks.length;
  }
}