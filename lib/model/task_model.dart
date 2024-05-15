import 'package:hive/hive.dart';

import 'package:hive_to_do/model/task_type_model.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  TaskModel(
      {required this.title,
      required this.subTitle,
      required this.time,
      this.isTaskDone = false,
      required this.taskTypeModel
      });

  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle;

  @HiveField(2)
  DateTime time;

  @HiveField(3)
  bool isTaskDone;

  @HiveField(4)
  TaskTypeModel taskTypeModel;
}
