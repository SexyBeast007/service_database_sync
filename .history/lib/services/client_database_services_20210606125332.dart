import 'package:hive/hive.dart';
import 'package:service_database_sync/models/book_model.dart';
import 'package:service_database_sync/services/server_database_services.dart';

class ClientDatabaseServices {
  final String _hiveBox = 'book_box';
  List<Book> _bookList = [];
  Book _activeBook;
  ServerDatabaseServices parseAction = ServerDatabaseServices();

  ///
  /// CREATE EVENT
  ///
  // Add book to database & update list
  Future<void> addBook(Book newBook) async {
    var box = await Hive.openBox<Book>(_hiveBox);
    await box.add(newBook);
    _bookList = box.values.toList();
    await parseAction.logCreateEvent(newBook);
  }

  ///
  /// READ EVENTS
  ///
  // Send database items to list
  void _databaseToRepository() async {
    var box = await Hive.openBox<Book>(_hiveBox);
    _bookList = box.values.toList();
  }

  // Return list for use
  Future<List<Book>> getBookList() {
    _databaseToRepository();
    return _bookList;
  }

  // Getter for list
  List<Book> get bookList => _bookList;

  // Return specific book
  Book getBook(index) {
    return _bookList[index];
  }

  // Return list length
  int get bookCount {
    return _bookList.length;
  }

  // Get active book
  Book getActiveBook() {
    return _activeBook;
  }

  // Set active book
  void setActiveBook(key) async {
    var box = await Hive.openBox<Book>(_hiveBox);
    _activeBook = box.get(key);
  }

  ///
  /// UPDATE EVENT
  ///
  // Updates specific book with new data
  void editBook({Book book, int bookKey}) async {
    var box = await Hive.openBox<Book>(_hiveBox);
    await box.put(bookKey, book);
    _bookList = box.values.toList();
    _activeBook = box.get(bookKey);
  }

  ///
  /// DELETE EVENTS
  ///
  // Deletes specific book and updates list
  Future<void> deleteBook(key) async {
    var box = await Hive.openBox<Book>(_hiveBox);
    await parseAction.logDeleteEvent(box.getAt(key));
    await box.deleteAt(key);
    _bookList = box.values.toList();
  }

  // Empties hive box for database reset
  Future<void> deleteAll() async {
    var box = await Hive.openBox<Book>(_hiveBox);
    await box.clear();
  }
}
