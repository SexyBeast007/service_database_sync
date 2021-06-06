import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:service_database_sync/data/books_hardcoded.dart';
import 'package:service_database_sync/models/book_model.dart';
import 'package:service_database_sync/services/client_database_services.dart';
import 'package:service_database_sync/services/server_database_services.dart';

///
///
/// Main

Future<void> main(List<String> arguments) async {
  Hive.init('hive_database');
  Hive.registerAdapter(BookAdapter());
  await Parse().initialize(
    ServerDatabaseServices().keyApplicationId,
    ServerDatabaseServices().keyParseServerUrl,
    clientKey: ServerDatabaseServices().keyClientKey,
    debug: true,
  );

  addBooksToLibrary();

  // var firstBook = Book(
  //   title: 'ABC',
  //   author: 'John Both',
  //   publishingDate: DateTime.now(),
  //   dateAdded: DateTime.now(),
  //   lastModified: DateTime.now(),
  // );

  // var firstBookEdit = Book(
  //   title: 'CBA',
  //   author: 'Sally Anne',
  //   publishingDate: DateTime.now().subtract(Duration(days: 7)),
  //   dateAdded: DateTime.now().subtract(Duration(days: 7)),
  //   lastModified: DateTime.now().subtract(Duration(days: 7)),
  // );

  // var firstEdit = DatabaseSyncItem(
  //   previousBookValue: firstBook,
  //   updatedBookValue: firstBookEdit,
  //   dateAdded: firstBook.dateAdded,
  //   lastModified: DateTime.now(),
  //   entryAction: DatabaseAction.update,
  // );

  // var test = firstEdit.toJson();

  // print(test);

  // var from = DatabaseSyncItem.fromJson(test);
  // print(from.updatedBookValue.toString());
}

void addBooksToLibrary() async {
  final bookDatabaseActions = ClientDatabaseServices();
  await bookDatabaseActions.addBook(bookOne);
  await bookDatabaseActions.addBook(bookTwo);
  await bookDatabaseActions.addBook(bookThree);
  await bookDatabaseActions.addBook(bookFour);
}

void deleteAllBooks() async {
  var bookDatabaseActions = ClientDatabaseServices();
  await bookDatabaseActions.deleteAll();
}

void printBookLibrary() async {
  var bookDatabaseActions = ClientDatabaseServices();
  print(bookDatabaseActions.bookList.toString());
}