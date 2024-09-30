import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/my_buttons.dart';

class MyDialogBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  TextEditingController controller;
  MyDialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //text

              TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Add a new task",
              ),
            ),

            //buttons -> save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButtons(btnName: "Save", onPressed:() {onSave(); },),

                const SizedBox(width: 8),
                //cancel button
                MyButtons(btnName: "Cancel", onPressed: () {onCancel(); },)

              ],
            )
          ],
        )
      ),
    );
  }
}
