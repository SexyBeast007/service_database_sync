import 'book_model.dart';

@HiveType(typeId: 1)
class DatabaseSyncItem {
  @HiveField(0)
  Book oldBookValue;

  @HiveField(1)
  Book updatedObjectValue;

  @HiveField(2)
  DateTime publishingDate;

  @HiveField(3)
  DateTime lastModified;
}