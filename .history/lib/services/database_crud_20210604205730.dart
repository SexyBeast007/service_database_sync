import 'package:service_database_sync/models/book_model.dart';

class DatabaseServices {
  String _hiveBox = 'book_box';
  List<Book> _bookList = [];
  Book _activeBook;

  ///
  /// CREATE EVENT
  ///
  // Add object to database & update repository
  void addGeometricObject(GeometricObject newObject) async {
    var box = await Hive.openBox<GeometricObject>(_hiveBox);
    await box.add(newObject);
    _objectList = box.values.toList();
    notifyListeners();
  }

  ///
  /// READ EVENTS
  ///
  // Send database items to repo list
  void _databaseToRepository() async {
    var box = await Hive.openBox<GeometricObject>(_hiveBox);
    _objectList = box.values.toList();
    notifyListeners();
  }

  // Return list for use
  List<GeometricObject> getObjectList() {
    _databaseToRepository();
    return _objectList;
  }

  // Return specific object
  GeometricObject getObject(index) {
    return _objectList[index];
  }

  // Return list length
  int get objectCount {
    return _objectList.length;
  }

  // Get active object
  GeometricObject getActiveObject() {
    return _activeObject;
  }

  // Set active object
  void setActiveObject(key) async {
    var box = await Hive.openBox<GeometricObject>(_hiveBox);
    _activeObject = box.get(key);
    notifyListeners();
  }

  ///
  /// UPDATE EVENT
  ///
  // Updates specific object with new data
  void editObject({GeometricObject object, int objectKey}) async {
    var box = await Hive.openBox<GeometricObject>(_hiveBox);
    await box.put(objectKey, object);
    _objectList = box.values.toList();
    _activeObject = box.get(objectKey);
    notifyListeners();
  }

  ///
  /// DELETE EVENT
  ///
  // Deletes specific object and updates list
  void deleteObject(key) async {
    var box = await Hive.openBox<GeometricObject>(_hiveBox);
    await box.deleteAt(key);
    _objectList = box.values.toList();
    notifyListeners();
  }
}