import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class toDoItem extends StatelessWidget {
  const toDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.OnDeleteItem,
  }) : super(key: key);
  final ToDo todo;
  final onToDoChanged;
  final OnDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          // print("To-Do Checked!");
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              decorationThickness: 2,
              fontSize: 16,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
              fontWeight: todo.isDone ? FontWeight.normal : FontWeight.bold,
              color: todo.isDone ? Colors.grey : Colors.black),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              // print("Deleted To-Do Item!");
              OnDeleteItem(todo.id);
            },
            icon: Icon(Icons.delete),
            color: Colors.white,
            iconSize: 20,
          ),
        ),
      ),
    );
  }
}
