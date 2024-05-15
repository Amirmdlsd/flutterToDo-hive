import 'package:flutter/material.dart';
import 'package:hive_to_do/constant/app_color.dart';
import 'package:hive_to_do/gen/assets.gen.dart';
import 'package:hive_to_do/model/task_model.dart';
import 'package:hive_to_do/screen/edit_task_screen.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  TaskModel task;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isTaskDone = false;
  @override
  void initState() {
    super.initState();
    isTaskDone = widget.task.isTaskDone;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTaskDone = !isTaskDone;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        width: double.infinity,
        height: 132,
        decoration: BoxDecoration(
          color: AppColor.appWhiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(widget.task.taskTypeModel.image),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.task.title,
                        style: const TextStyle(fontSize: 17),
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                          ),
                          value: isTaskDone,
                          activeColor: AppColor.appGreenColor,
                          onChanged: (value) {
                            setState(() {
                              isTaskDone = value!;
                              widget.task.isTaskDone = isTaskDone;
                              widget.task.save();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .55,
                    child: Text(
                      widget.task.subTitle,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return  EditTaskScreen(
                                  task: widget.task,
                                );
                              },
                            ));
                          },
                          child: _containerButton(
                              text: "ویرایش",
                              image: Assets.images.iconEdit.path,
                              containerColor: AppColor.applightGreenColor,
                              textColor: AppColor.appGreenColor),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        _containerButton(
                            text:
                                "${widget.task.time.hour}:${showFullMinute(widget.task.time)}",
                            image: Assets.images.iconTime.path,
                            containerColor: AppColor.appGreenColor,
                            textColor: AppColor.appWhiteColor),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String showFullMinute(DateTime time) {
    if (time.minute < 10) {
      return "0${time.minute}";
    } else {
      return time.minute.toString();
    }
  }

  Widget _containerButton({
    required String image,
    required String text,
    required Color containerColor,
    required Color textColor,
  }) {
    return Container(
      width: 92,
      height: 28,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: containerColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            width: 16,
            height: 16,
          ),
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 14),
          )
        ],
      ),
    );
  }
}
