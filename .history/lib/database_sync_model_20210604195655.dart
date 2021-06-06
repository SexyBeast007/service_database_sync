import 'book_model.dart';

@HiveType(typeId: 1)
class DatabaseSyncItem {
  @HiveField(0)
  Book previousBookValue;

  @HiveField(1)
  Book updatedBookValue;

  @HiveField(2)
  DateTime lastEdited;

  @HiveField(3)
  DateTime lastModified;
}