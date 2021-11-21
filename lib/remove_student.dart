import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_app/api.dart';
import 'api.dart';
import 'main.dart';

class RemoveStudent extends StatefulWidget {
  final String id, lessonInstructor, lessonId, lessonName;
  final List lessonClassList;
  final int lessonCredits;

  final StudentAPI api = StudentAPI();

  RemoveStudent(this.id, this.lessonInstructor, this.lessonCredits,
      this.lessonId, this.lessonName, this.lessonClassList);

  @override
  _RemoveStudentState createState() => _RemoveStudentState(id, lessonInstructor,
      lessonCredits, lessonId, lessonName, lessonClassList);
}

class _RemoveStudentState extends State<RemoveStudent> {
  final String id, lessonInstructor, lessonId, lessonName;
  final List lessonClassList;
  final int lessonCredits;
  final StudentAPI api = StudentAPI();

  _RemoveStudentState(this.id, this.lessonInstructor, this.lessonCredits,
      this.lessonId, this.lessonName, this.lessonClassList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("These are the students of \n" +
            lessonName +
            ", click them to remove them."),
      ),
      body: Center(
        child: Column(
          children: [
            for (var item in lessonClassList)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "Student ID " +
                              (item.toString().split('{')[1].split("}")[0])
                                  .split(":")[1],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      width: 300,
                      height: 40,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue[800],
                        border: Border.all(width: 3, color: Colors.black))),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home_max_rounded),
        onPressed: () => {
          Navigator.pop(context),
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(title: "Student Page")),
          ),
        },
      ),
      bottomSheet: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
        onPressed: () => {
          api.deleteClass(id),
          Navigator.pop(context),
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: "Student Page")))
        },
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Delete Class",
              style: TextStyle(color: Colors.white, fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          width: 500,
        ),
      ),
    );
  }
}
