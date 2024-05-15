import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_to_do/constant/app_color.dart';
import 'package:hive_to_do/model/task_model.dart';
import 'package:hive_to_do/utils/utils.dart';
import 'package:hive_to_do/widget/task_type_image.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();
  DateTime? _time;
  var box = Hive.box<TaskModel>("taskBox");
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _addInput(
                  title: 'نام تسک',
                  line: 1,
                  txtEditingController: titleController),
              _addInput(
                  title: 'توضیحات',
                  line: 2,
                  txtEditingController: subTitleController),
              CustomHourPicker(
                title: "زمان را انتخاب کنید",
                titleStyle: const TextStyle(color: AppColor.appDarkColor),
                onNegativePressed: (context) {},
                onPositivePressed: (context, time) {
                  _time = time;
                },
                positiveButtonText: "انتخاب زمان",
                negativeButtonText: "حذف زمان",
                negativeButtonStyle: const TextStyle(color: Colors.red),
                positiveButtonStyle:
                    const TextStyle(color: AppColor.appGreenColor),
              ),
              TaskTypeImage(selectedIndex: selectedIndex)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: ElevatedButton(
            onPressed: () {
              addToBox(titleController.text, subTitleController.text);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.appGreenColor,
                fixedSize: const Size(100, 44)),
            child: const Text(
              "اضافه کردن",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  addToBox(String title, String subTitle) {
    TaskModel task = TaskModel(
        title: title,
        subTitle: subTitle,
        time: _time!,
        taskTypeModel: getTaskTypeList()[selectedIndex]);
    box.add(task);
  }

  Widget _addInput(
      {required String title,
      required int line,
      required TextEditingController txtEditingController}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      child: TextField(
        controller: txtEditingController,
        maxLines: line,
        decoration: InputDecoration(
          label: Text(title),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(width: 2, color: AppColor.appGreyColor)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: AppColor.appGreenColor, width: 2),
          ),
        ),
      ),
    );
  }
}
