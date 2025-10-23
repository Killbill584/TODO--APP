// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Tododatabase {
  List parameters = [];
  final mybox = Hive.box('mybox');

  void create() {
    parameters = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  void loaddata() {
    mybox.get("TODOLIST");
  }

  void push() {
    mybox.put("TODOLIST", parameters);
  }
}
