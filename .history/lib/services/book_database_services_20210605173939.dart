import 'package:service_database_sync/data/books_hardcoded.dart';
import 'package:service_database_sync/services/book_database_actions.dart';

class BookDatabaseServices {
  Future<void> addLibraryToDatabase() async {
    var bookDatabaseActions = BookDatabaseActions();
    await bookDatabaseActions.addBook(bookOne);
    await bookDatabaseActions.addBook(bookTwo);
    await bookDatabaseActions.addBook(bookThree);
    await bookDatabaseActions.addBook(bookFour);
  }

  Future<void> emptyDatabase() async {
    var bookDatabaseActions = BookDatabaseActions();
    await bookDatabaseActions.deleteAll();
  }

  void printDatabase()  {
    var bookDatabaseActions = BookDatabaseActions();
    print(await bookDatabaseActions.bookList);
  }
}
