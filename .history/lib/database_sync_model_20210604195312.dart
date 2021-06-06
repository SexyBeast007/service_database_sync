@HiveType(typeId: 1)
class DatabaseSyncItem {
  @HiveField(0)
  dynamic object;

  @HiveField(1)
  String author;

  @HiveField(2)
  DateTime publishingDate;

  @HiveField(3)
  DateTime lastModified;
}