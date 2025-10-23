import 'package:flutter/material.dart';
import 'package:my_app/tdapp/utili/mybuttons.dart';

// ignore: must_be_immutable
class Taskcreate extends StatelessWidget {
  dynamic controller;
  VoidCallback saveit;
  VoidCallback cancelit;
  Taskcreate({
    super.key,
    required this.controller,
    required this.cancelit,
    required this.saveit,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(249, 122, 10, 228),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task",
              ),
              controller: controller,
            ),
            Row(
              children: [
                Mybutton(text: "save", onpressed: saveit),
                SizedBox(width: 8),
                Mybutton(text: "Cancel", onpressed: cancelit),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
