import 'package:flutter/material.dart';

import '../models/task.dart';
import 'task_tile.dart';
class TasksList extends StatefulWidget {
  final List<Task>tasks;
  TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {


  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      itemCount: widget.tasks.length,
        itemBuilder:(context,index){
          return TaskTile(
              isChecked:widget. tasks [index].isDone,
              taskTitle:widget. tasks[index].name,
            checkboxChange :( newValue){
                setState(() {
                  widget.tasks[index].danechange();

                });
          }
          );
        }, );
    // return ListView(
    //   children: [
    //     TaskTile(
    //       taskTitle:task[0].name,
    //       isChecked: task[0].isDone,
    //     ),
    //     TaskTile(
    //     taskTitle:task[1].name,
    // isChecked: task[1].isDone,
    // ),
    //
    //     TaskTile(
    //       taskTitle:task[2].name,
    //       isChecked: task[2].isDone,
    //     ),
    //   ],
    // );
  }
}

