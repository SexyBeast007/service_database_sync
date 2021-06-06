import 'package:service_database_sync/data/books_hardcoded.dart';
import 'package:service_database_sync/services/book_database_actions.dart';

class BookDatabaseServices {
  void addLibraryToDatabase() async {
    var bookDatabaseActions = BookDatabaseActions();
    await bookDatabaseActions.addBook(bookOne);
    await bookDatabaseActions.addBook(bookTwo);
    await bookDatabaseActions.addBook(bookThree);
    await bookDatabaseActions.addBook(bookFour);
  }

  void emptyDatabase() {
    var bookDatabaseActions = BookDatabaseActions();
    bookDatabaseActions.deleteAll();
  }

  void printDatabase() {
    print(BookDatabaseActions().bookList);
  }
}
