import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              index: index,
                isChecked: taskData.tasks[index].isDone,
                taskTitle: taskData.tasks[index].name,
                toggleCheckbox: (bool newValue) {
                  Provider.of<TaskData>(context,listen: false).toggleTask(newValue, index);
                });
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
