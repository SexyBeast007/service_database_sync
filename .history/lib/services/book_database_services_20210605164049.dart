import 'package:service_database_sync/data/books_hardcoded.dart';
import 'package:service_database_sync/services/book_database_actions.dart';

class BookDatabaseServices {
  void addLibraryToDatabase() async {
    BookDatabaseActions().addBook(Book(
  title: 'The ghost of the barn',
  author: 'Kosmas Brink',
  publishingDate: DateTime(1998, 11, 2),
  dateAdded: DateTime.now(),
  lastModified: DateTime.now(),
););
    BookDatabaseActions().addBook(bookTwo);
    BookDatabaseActions().addBook(bookThree);
    BookDatabaseActions().addBook(bookFour);
  }

  void emptyDatabase() {
    BookDatabaseActions().deleteAll();
  }

  void printDatabase() {
    print(BookDatabaseActions().bookList);
  }
  
}
