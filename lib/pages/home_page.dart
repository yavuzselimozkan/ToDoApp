// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; // import DateFormat class
import 'package:to_do_app/pages/favourites_page.dart';
import 'package:to_do_app/pages/settings_page.dart';
import 'package:to_do_app/pages/todoDatabase.dart';
import 'package:to_do_app/utilities/dialog_box.dart';

import '../utilities/to_do_tile.dart';
import 'MainPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _mybox= Hive.box('taskbox');
  ToDoDatabase db= ToDoDatabase();



  //controller
  final _controller= TextEditingController();

  //save added task
  void saveTask()
  {
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //create a new task
  void createNewTask()
  {
    showDialog(context: context, builder: (context)
    {
      return MyDialogBox(controller: _controller,onSave: saveTask ,onCancel: ()=>Navigator.of(context).pop(),);
    },
    );
  }


  // it assigned current date value
  String _currentDate= DateFormat('dd/MM/yy').format(DateTime.now());

  //navigate pages val
  int _selectedIndex=0;
  List<Widget> _pages=[
    MainPage(),
    FavouritesPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
      centerTitle: true,
      title: Text("TO DO",
        style: TextStyle(fontWeight: FontWeight.bold, ),
      ),
      actions: [
        Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_currentDate, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            )
        )
      ],
      backgroundColor: Colors.yellow[600],
      elevation: 0,
    ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[600],
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      body: _pages[_selectedIndex],
      bottomNavigationBar: setNavbar()

    );
  }

  Widget setNavbar()
  {
    return  Container(
      color: Colors.black,
      child: GNav(
        activeColor: Colors.white,
        color: Colors.white,
        tabActiveBorder: Border(bottom: BorderSide(color: Colors.white)),
        selectedIndex: _selectedIndex,
        onTabChange: (index){
          setState(() {
              _selectedIndex=index;
          });
        },
        tabs: [
          GButton(icon: Icons.home,text: "Home"),
          GButton(icon: Icons.favorite_border,text:"Favourites"),
          GButton(icon: Icons.settings,text:"Settings")
        ],

      ),
    );
  }
}
