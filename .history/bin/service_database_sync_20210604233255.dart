import 'package:service_database_sync/models/book_model.dart';
import 'package:service_database_sync/models/database_sync_model.dart';

///
///
/// Main

void main(List<String> arguments) {
  var firstBook = Book(
    title: 'ABC',
    author: 'John Both',
    publishingDate: DateTime.now(),
    dateAdded: DateTime.now(),
    lastModified: DateTime.now(),
  );

  var firstBookEdit = Book(
    title: 'CBA',
    author: 'Sally Anne',
    publishingDate: DateTime.now().subtract(Duration(days: 7)),
    dateAdded: DateTime.now().subtract(Duration(days: 7),
    lastModified: DateTime.now(),
  );

  var firstWrite = DatabaseSyncItem()
}
