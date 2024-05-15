import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_to_do/constant/app_color.dart';
import 'package:hive_to_do/model/task_model.dart';
import 'package:hive_to_do/utils/utils.dart';
import 'package:hive_to_do/widget/task_type_image.dart';
import 'package:time_pickerr/time_pickerr.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key, required this.task});
  TaskModel task;
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  int selectedIndex = 0;
  TextEditingController? titleController;
  TextEditingController? subTitleControlle;
  DateTime? _time;
  var box = Hive.box<TaskModel>("taskBox");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    subTitleControlle = TextEditingController(text: widget.task.subTitle);
    _time = widget.task.time;
    var index = getTaskTypeList().indexWhere(
        (element) => element.avtivity == widget.task.taskTypeModel.avtivity);
    selectedIndex = index;
  }

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
                  txtEditingController: titleController!),
              _addInput(
                  title: 'توضیحات',
                  line: 2,
                  txtEditingController: subTitleControlle!),
              CustomHourPicker(
                date: _time,
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
              editTask();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.appGreenColor,
                fixedSize: const Size(100, 44)),
            child: const Text(
              "ویرایش",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  Widget _getImageActivityList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: getTaskTypeList().length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var list = getTaskTypeList()[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 150,
                    width: MediaQuery.of(context).size.width * .4,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? AppColor.appGreenColor
                          : AppColor.appWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: selectedIndex == index
                              ? AppColor.appGreenColor
                              : AppColor.appGreyColor),
                    ),
                    child: Image.asset(list.image),
                  ),
                ),
                Text(
                  list.title,
                  style: TextStyle(
                      color: selectedIndex == index
                          ? AppColor.appGreenColor
                          : AppColor.appDarkColor),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  editTask() {
    widget.task.title = titleController!.text;
    widget.task.subTitle = subTitleControlle!.text;
    widget.task.time = _time!;
    widget.task.taskTypeModel = getTaskTypeList()[selectedIndex];
    widget.task.save();
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
