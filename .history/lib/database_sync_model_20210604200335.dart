import 'book_model.dart';

@HiveType(typeId: 1)
class DatabaseSyncItem {
  @HiveField(0)
  Book previousBookValue;

  @HiveField(1)
  Book updatedBookValue;

  @HiveField(2)
  DateTime dateAdded;

  @HiveField(3)
  DateTime lastModified;

  @HiveField(4)
  DatabaseAction entryAction;
}

@HiveType(typeId: 2)
enum DatabaseAction {
  @HiveField(0)
  create,

  @HiveField(1)
  update,

  @HiveField(2)
}