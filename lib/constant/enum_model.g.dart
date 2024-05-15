// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskActivityAdapter extends TypeAdapter<TaskActivity> {
  @override
  final int typeId = 3;

  @override
  TaskActivity read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskActivity.working;
      case 2:
        return TaskActivity.meditate;
      default:
        return TaskActivity.working;
    }
  }

  @override
  void write(BinaryWriter writer, TaskActivity obj) {
    switch (obj) {
      case TaskActivity.working:
        writer.writeByte(0);
        break;
      case TaskActivity.meditate:
        writer.writeByte(2);
        break;
      case TaskActivity.meeting:
        // TODO: Handle this case.
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
