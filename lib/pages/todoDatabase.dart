
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase
{
  List toDoList=[];

  //reference a box
  final _mybox=Hive.box('taskbox');

  // create default data if the app 1st time ever run
  void createInitialData()
  {
    toDoList=[["Make a tutorial",false],["Do exercise",false]];
  }

  // if app run anytime after the 1st time load from the database
  void loadData()
  {
    toDoList=_mybox.get("TODOLIST");
  }

  // update the database
  void updateData()
  {
     _mybox.put("TODOLIST",toDoList);
  }

}