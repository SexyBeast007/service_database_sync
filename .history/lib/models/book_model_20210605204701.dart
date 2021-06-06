import 'package:hive/hive.dart';
part 'book_model.g.dart';

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

  Book({
    this.title,
    this.author,
    this.publishingDate,
    this.dateAdded,
    this.lastModified,
  });

  Book.fromJson(Map<String, dynamic> json)
  : title = 
}
