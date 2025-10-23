// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final String t;
  final bool taskcompleted;
  final Function(bool?)? ontapped;
  const Todo({
    super.key,
    required this.ontapped,
    required this.t,
    required this.taskcompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15.0,
        bottom: 10.0,
      ),
      child: Container(
        child: Row(
          children: [
            Checkbox(value: taskcompleted, onChanged: ontapped),
            Expanded(
              child: Text(
                t,
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.2,
                  wordSpacing: 2,
                  decoration: taskcompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          border: Border.all(color: const Color.fromARGB(255, 171, 146, 216)),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.only(left: 18, top: 18, right: 18, bottom: 9),
      ),
    );
  }
}
