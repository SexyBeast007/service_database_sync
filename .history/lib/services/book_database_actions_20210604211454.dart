import 'package:hive/hive.dart';
import 'package:service_database_sync/models/book_model.dart';

class BookDatabaseActions {
  final String _hiveBox = 'book_box';
  List<Book> _bookList = [];
  Book _activeBook;

  ///
  /// CREATE EVENT
  ///
  // Add book to database & update list
  void addBook(Book newBook) async {
    var box = await Hive.openBox<Book>(_hiveBox);
    await box.add(newBook);
    _bookList = box.values.toList();
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
  List<Book> getObjectList() {
    _databaseToRepository();
    return _bookList;
  }

  // Return specific book
  Book getObject(index) {
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
  /// DELETE EVENT
  ///
  // Deletes specific book and updates list
  void deleteBook(key) async {
    var box = await Hive.openBox<Book>(_hiveBox);
    await box.deleteAt(key);
    _bookList = box.values.toList();
  }
}