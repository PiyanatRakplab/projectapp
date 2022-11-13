import 'package:flutter/material.dart';
import 'package:projectapp/todo.dart';
import 'addtodo.dart';
import 'color.dart';
import 'main.dart';

class MytodoPage extends StatefulWidget {
  MytodoPage({Key? key}) : super(key: key);
  @override
  _MytodoPageState createState() => _MytodoPageState();
}

class _MytodoPageState extends State<MytodoPage> {
  bool selected = false;
  final _todoController = TextEditingController();
  final Todolist = ToDo.todoList();
  List<ToDo> _list = [];
  @override
  void initState() {
    _list = Todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jetstream,
      appBar: AppBar(
          backgroundColor: bar,
          title: Row(
            children: [

              Text(' My List',),

            ],

          )),

      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ListView(
              children: [
                for (ToDo todoo in _list.reversed)
                  AddToDo(
                    todo: todoo,
                    onToDoChanged: _handleToDoChange,
                    onDeleteItem: _deleteToDoItem,
                  ),
              ],
            ),

          ),
          Container(
            child: ElevatedButton(
              child: const Text('กลับสู่หน้าหลัก'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstRoute()),
                );
                // Navigate to second route when tapped.
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                      right: 10,
                      left: 10,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Enter New ToDo 📝',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                    right: 10,
                    left: 10,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                      print(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: bar,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      Todolist.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      Todolist.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = Todolist;
    } else {
      results = Todolist.where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _list = results;
    });
  }
}