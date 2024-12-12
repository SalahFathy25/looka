import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxChange;
  final void Function() listTileDelete;
  final void Function() listTileUpdate;

  const TaskTile(
      {super.key,
      required this.isChecked,
      required this.taskTitle,
      required this.checkboxChange,
      required this.listTileDelete,
      required this.listTileUpdate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked,
        onChanged: checkboxChange,
      ),
      onLongPress: listTileDelete,
      onTap: listTileUpdate,
    );
  }
}
