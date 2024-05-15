import 'package:flutter/material.dart';
import 'package:hive_to_do/constant/app_color.dart';
import 'package:hive_to_do/utils/utils.dart';

class TaskTypeImage extends StatefulWidget {
   TaskTypeImage({super.key,required this.selectedIndex});
  int selectedIndex;
  @override
  State<TaskTypeImage> createState() => _TaskTypeImageState();
}

class _TaskTypeImageState extends State<TaskTypeImage> {
  @override
  Widget build(BuildContext context) {
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
                      widget.selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 150,
                    width: MediaQuery.of(context).size.width * .4,
                    decoration: BoxDecoration(
                      color: widget.selectedIndex == index
                          ? AppColor.appGreenColor
                          : AppColor.appWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: widget.selectedIndex == index
                              ? AppColor.appGreenColor
                              : AppColor.appGreyColor),
                    ),
                    child: Image.asset(list.image),
                  ),
                ),
                Text(
                  list.title,
                  style: TextStyle(
                      color: widget.selectedIndex == index
                          ? AppColor.appGreenColor
                          : AppColor.appDarkColor),
                )
              ],
            );
          },
        ),
      ),
    );
    ;
  }
}
