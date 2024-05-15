import 'package:hive_flutter/adapters.dart';
part 'enum_model.g.dart';
@HiveType(typeId: 3)
enum TaskActivity {
  @HiveField(0)
  working,

  @HiveType(typeId: 1)
  meeting,

  @HiveField(2)
  meditate
}
