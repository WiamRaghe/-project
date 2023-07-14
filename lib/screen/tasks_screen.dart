



import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task>tasks=[
    Task(name: 'go shopping'),
    Task(name: 'bay gift'),
    Task(name: 'repair the car'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context)=>SingleChildScrollView(child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen((newTaskTitle){
                  setState(() {
                    tasks.add(Task(name: newTaskTitle));
                    Navigator.pop(context);
                  });

                }),
          ),
          ),
          );
        },

        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        padding:const   EdgeInsets.only(top: 60,left: 20,right: 20,bottom: 80
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.playlist_add_check,size: 40,color: Colors.white,),
                SizedBox(width: 20),
                Text('ToDayDo',style: TextStyle(
                  color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,
                ),
                ),


              ],
            ),
            Text('${tasks.length}Tasks',
              style: TextStyle(color: Colors.white,fontSize: 18,),),
            SizedBox(height: 20),
            Expanded(
              child: Container(

                decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20),)
                ),
                child: TasksList(tasks),
                ),
            ),
          ],
        ) ,
      ),

    );
  }
}

