import 'package:hive_flutter/adapters.dart';
import 'package:hive_to_do/constant/enum_model.dart';

part 'task_type_model.g.dart';

@HiveType(typeId: 2)
class TaskTypeModel {
  TaskTypeModel(
      {required this.title, required this.image, required this.avtivity});

@HiveField(0)
  String title;

@HiveField(1)
  String image;

@HiveField(2)
  TaskActivity avtivity;
}
