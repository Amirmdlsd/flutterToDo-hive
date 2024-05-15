import 'package:hive_to_do/constant/enum_model.dart';
import 'package:hive_to_do/gen/assets.gen.dart';
import 'package:hive_to_do/model/task_type_model.dart';

List<TaskTypeModel> getTaskTypeList() {
  var list = [
    TaskTypeModel(
        image: Assets.images.meditate.path,
        title: "تمرکز",
        avtivity: TaskActivity.meditate),
    TaskTypeModel(
        image: Assets.images.socialFrends.path,
        title: "قرار دوستانه",
        avtivity: TaskActivity.meeting),
    TaskTypeModel(
        image: Assets.images.hardWorking.path,
        title: "کارزیاد",
        avtivity: TaskActivity.working),
  ];
  return list;
}
