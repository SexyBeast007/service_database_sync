@HiveType(typeId: 0)
class Book {
  @HiveField(0)
  String title;

  @HiveField(1)
  String author;

  @HiveField(2)
  DateTime publishingDate;

  @HiveField(3)
  DateTime dateAdded;

  @HiveField(4)
  DateTime lastModified;

  /// Override toString() so that we can print actual objects instead of instances
  @override
  String toString() {
    return 'Book {name: $objectName, faces: $objectFaces, weight: $objectWeight}';
  }
}
