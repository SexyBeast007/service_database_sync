import 'package:service_database_sync/models/book_model.dart';

class ProgramServices {
  List<Book> library = []
  DateTime now = DateTime.now();
  ..add(Book(title: 'The ghost of the barn', author: 'Kosmas Brink', publishingDate: DateTime(1998, 11, 2), dateAdded: now, lastModified: now))
}
