import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../utilities/to_do_tile.dart';
import 'todoDatabase.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    //if this is the 1st time ever opening the app then create default data
    if(_mybox.get("TODOLIST")==null)
    {
      db.createInitialData();
    }
    else //this is already exists
        {
      db.loadData();
    }
    super.initState();
  }

  final _mybox= Hive.box('taskbox');
  ToDoDatabase db= ToDoDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value)=>checkBoxChanged(value, index),
            deleteFunction:(context)=> deleteTask(index),
          );
        },
      ),
    );
  }

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index)
  {
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateData();
  }

  //delete a task
  void deleteTask(int index)
  {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

}
