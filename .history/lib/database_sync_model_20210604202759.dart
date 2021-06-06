import 'book_model.dart';
import 'package:hive/hive.dart';
part '';

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

  DatabaseSyncItem({
    this.previousBookValue,
    this.updatedBookValue,
    this.dateAdded,
    this.lastModified,
    this.entryAction,
  });
}

enum DatabaseAction {
  create,
  update,
  delete,
}
