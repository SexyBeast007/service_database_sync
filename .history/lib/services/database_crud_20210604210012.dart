import 'package:hive/hive.dart';
import 'package:service_database_sync/models/book_model.dart';

class DatabaseCRUD {
  String _hiveBox = 'book_box';
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
  // Send database items to repo list
  void _databaseToRepository() async {
    var box = await Hive.openBox<Book>(_hiveBox);
    _bookList = box.values.toList();
  }

  // Return list for use
  List<Book> getObjectList() {
    _databaseToRepository();
    return _bookList;
  }

  // Return specific object
  Book getObject(index) {
    return _bookList[index];
  }

  // Return list length
  int get objectCount {
    return _bookList.length;
  }

  // Get active object
  Book getActiveObject() {
    return _bookList;
  }

  // Set active object
  void setActiveObject(key) async {
    var box = await Hive.openBox<GeometricObject>(_hiveBox);
    _activeObject = box.get(key);
  }

  ///
  /// UPDATE EVENT
  ///
  // Updates specific object with new data
  void editObject({GeometricObject object, int objectKey}) async {
    var box = await Hive.openBox<GeometricObject>(_hiveBox);
    await box.put(objectKey, object);
    _bookList = box.values.toList();
    _activeObject = box.get(objectKey);
  }

  ///
  /// DELETE EVENT
  ///
  // Deletes specific object and updates list
  void deleteObject(key) async {
    var box = await Hive.openBox<GeometricObject>(_hiveBox);
    await box.deleteAt(key);
    _bookList = box.values.toList();
  }
}