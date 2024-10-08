// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/utilities/star_widget.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({super.key ,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0,right:25,top:25),

      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow[500],
              borderRadius: BorderRadius.circular(12)
          ),

          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                //checkbox
                Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.black),

                Text(
                  taskName,
                  style: TextStyle(fontSize: 20,
                      decoration:
                      taskCompleted? TextDecoration.lineThrough: TextDecoration.none),
                ),
                Spacer(),

                StarWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

}
