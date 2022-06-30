import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final int index;
  final bool isChecked;
  final String taskTitle;
  final Function toggleCheckbox;
  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.toggleCheckbox,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: GestureDetector(
          onTap: (){
            Provider.of<TaskData>(context,listen: false).toggleTask(isChecked, index);
          },
          onLongPress: (){
            Provider.of<TaskData>(context,listen: false).deleteTask(index);
          },
          child: Text(
              taskTitle,
              style: TextStyle(
                  decoration: isChecked ? TextDecoration.lineThrough : null),
            ),
        ),

        trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: (newValue) {
              toggleCheckbox(newValue);
            }));
  }
}
