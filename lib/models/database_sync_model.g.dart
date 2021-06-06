// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_sync_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseSyncItemAdapter extends TypeAdapter<DatabaseSyncItem> {
  @override
  final int typeId = 1;

  @override
  DatabaseSyncItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabaseSyncItem(
      previousBookValue: fields[0] as Book,
      updatedBookValue: fields[1] as Book,
      dateAdded: fields[2] as DateTime,
      lastModified: fields[3] as DateTime,
      entryAction: fields[4] as DatabaseAction,
    );
  }

  @override
  void write(BinaryWriter writer, DatabaseSyncItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.previousBookValue)
      ..writeByte(1)
      ..write(obj.updatedBookValue)
      ..writeByte(2)
      ..write(obj.dateAdded)
      ..writeByte(3)
      ..write(obj.lastModified)
      ..writeByte(4)
      ..write(obj.entryAction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseSyncItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
