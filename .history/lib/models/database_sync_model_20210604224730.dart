import 'book_model.dart';
import 'package:hive/hive.dart';
part 'database_sync_model.g.dart';

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

  // Turn json back into data model
  DatabaseSyncItem.fromJson(Map<String, dynamic> json)
      : previousBookValue = json['previousBookValue'],
        updatedBookValue = json['updatedBookValue'],
        dateAdded = json['dateAdded'],
        lastModified = json['lastModified'],
        entryAction = json['entryAction'];

        Map<String, dynamic> toJson() => {
          'previousBookValue': previousBookValue,
          'updatedBookValue': updatedBookValue,
          'dateAdded': 
        }
}

enum DatabaseAction {
  create,
  update,
  delete,
}
