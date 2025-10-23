import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/tdapp/database/database.dart';
import 'package:my_app/tdapp/utili/input.dart';
import 'package:my_app/tdapp/tdtile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final mybox = Hive.box('mybox');
  Tododatabase db = Tododatabase();
  @override
  void initState() {
    super.initState();
    if (mybox.get("TODOLIST") == null) {
      db.create();
    } else {
      db.loaddata();
    }
  }

  final controller = TextEditingController();
  void saveit() {
    setState(() {
      db.parameters.add([controller.text, false]);
    });
    controller.clear();
    Navigator.of(context).pop();
  }

  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return Taskcreate(
          controller: controller,
          saveit: saveit,
          cancelit: () {
            Navigator.of(context).pop();
            controller.clear();
          },
        );
      },
    );
  }

  void ontapped(int index, bool? value) {
    setState(() {
      db.parameters[index][1] = !db.parameters[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T O  D O', textAlign: TextAlign.center),
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 166, 137, 235),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.parameters.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                db.parameters.removeAt(index);
              });
            },
            background: Container(
              color: Colors.redAccent,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: Todo(
              t: db.parameters[index][0],
              taskcompleted: db.parameters[index][1],
              ontapped: (calue) => ontapped(index, calue),
            ),
          );
        },
      ),
    );
  }
}
