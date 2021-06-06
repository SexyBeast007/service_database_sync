@HiveType(typeId: 1)
class DatabaseSyncItem {
  @HiveField(0)
  dynamic previousObjectValue;

  @HiveField(1)
  dynamic author;

  @HiveField(2)
  DateTime publishingDate;

  @HiveField(3)
  DateTime lastModified;
}