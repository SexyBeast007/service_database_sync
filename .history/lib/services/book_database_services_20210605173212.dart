import 'package:service_database_sync/data/books_hardcoded.dart';
import 'package:service_database_sync/services/book_database_actions.dart';

class BookDatabaseServices {
  void addLibraryToDatabase() async {
    var bookDatabaseActions = BookDatabaseActions();
    await bookDatabaseActions.addBook(bookOne)
    ..addBook(bookTwo)
    ..addBook(bookThree);
    BookDatabaseActions().addBook(bookFour);
  }

  void emptyDatabase() {
    BookDatabaseActions().deleteAll();
  }

  void printDatabase() {
    print(BookDatabaseActions().bookList);
  }
}
