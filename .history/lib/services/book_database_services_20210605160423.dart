import 'package:service_database_sync/data/books_hardcoded.dart';
import 'package:service_database_sync/services/book_database_actions.dart';

class BookDatabaseServices {
  void addLibraryToDatabase() {
    BookDatabaseActions().addBook(bookOne);
    BookDatabaseActions().addBook(bookTwo);
    BookDatabaseActions().addBook(bookThree);
    BookDatabaseActions().addBook(bookFour);
  }

  void emptyDatabase() {
    BookDatabaseActions().deleteAll();
  }

  Function printDatabase()
}
