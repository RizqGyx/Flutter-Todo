import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/widgets/todo_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final todoList = ToDo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(statusBarColor: Colors.black),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  _searchBox(),
                  _Content(),
                ],
              ),
            ),
            _action(),
          ],
        ),
      ),
    );
  }

  Align _action() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: 0.0,
                      color: Color.fromRGBO(47, 35, 35, 1),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration(
                    hintText: 'Add New To-Do Item', border: InputBorder.none),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 20,
              right: 15,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                minimumSize: Size(55, 55),
              ),
              onPressed: () {
                addItemToDo(_todoController.text);
              },
              child: Icon(
                Icons.playlist_add_outlined,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _Content() {
    return Expanded(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 50,
              bottom: 20,
            ),
            child: Text(
              "To-Do List",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          for (ToDo display in todoList)
            toDoItem(
              todo: display,
              onToDoChanged: _handleToDo,
              OnDeleteItem: _handleDelete,
            ),
        ],
      ),
    );
  }

  void _handleToDo(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDelete(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void addItemToDo(String todo) {
    setState(() {
      todoList.add(ToDo(id: '5', todoText: todo));
    });
    _todoController.clear();
  }

  Column _searchBox() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Align(
                widthFactor: 2,
                child: Icon(
                  Icons.search,
                  color: Color(0xFF6C5F5F),
                  size: 25,
                ),
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 25,
                minWidth: 30,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Color(0xFF6C5F5F),
                ),
              ),
              hintText: "Search....",
            ),
          ),
        ),
        Center(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Done",
                ),
              ),
              Icon(
                Icons.check_box_outline_blank_rounded,
                color: Colors.red.shade500,
                size: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Not Done",
                ),
              ),
              Icon(
                Icons.check_box_outline_blank_rounded,
                color: Colors.red.shade500,
                size: 30,
              )
            ],
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Color(0xFF6C5F5F),
            size: 30,
          ),
          Container(
            child: Text("Muhammad Rizki"),
          ),
          Container(
            // height: 50,
            // width: 50,
            child: Icon(
              Icons.account_circle,
              color: Color(0xFF6C5F5F),
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
