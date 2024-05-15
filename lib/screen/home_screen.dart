import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_to_do/constant/app_color.dart';
import 'package:hive_to_do/widget/task_widget.dart';
import 'package:hive_to_do/gen/assets.gen.dart';
import 'package:hive_to_do/model/task_model.dart';
import 'package:hive_to_do/screen/add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box<TaskModel>("taskBox");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appGreyColor,
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: box.values.toList().length,
            itemBuilder: (context, index) {
              var taskList = box.values.toList()[index];
              print(taskList.taskTypeModel.title);
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  taskList.delete();
                },
                child: TaskWidget(
                  task: taskList,
                ),
              );
            },
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.appGreenColor,
        child: Image.asset(Assets.images.iconAdd.path),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const AddTaskScreen();
            },
          ));
        },
      ),
    );
  }
}
