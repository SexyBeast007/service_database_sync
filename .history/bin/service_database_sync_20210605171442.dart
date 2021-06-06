import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:service_database_sync/data/books_hardcoded.dart';
import 'package:service_database_sync/models/book_model.dart';
import 'package:service_database_sync/models/database_sync_model.dart';
import 'package:service_database_sync/services/book_database_actions.dart';
import 'package:service_database_sync/services/book_database_services.dart';

///
///
/// Main

Future<void> main(List<String> arguments) async {
  Hive.init('hive_database');
  Hive.registerAdapter(BookAdapter());

  BookDatabaseActions bookDatabaseActions;

  var box = await Hive.openBox<Book>('book_library');
  await box.add(bookOne);
  print(box.values.toString());
  await box.clear();
  print(box.values.toString());

  bookDatabaseActions.addBook(Book(title: 'wer', author: 'erdfs', publishingDate: DateTime.now(), dateAdded: DateTime.now()));

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
