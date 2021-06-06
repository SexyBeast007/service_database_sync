import 'package:hive/hive.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:service_database_sync/data/books_hardcoded.dart';
import 'package:service_database_sync/models/book_model.dart';
import 'package:service_database_sync/services/client_database_services.dart';
import 'package:service_database_sync/services/server_database_services.dart';

Future<void> main(List<String> arguments) async {
  Hive.init('hive_database');
  Hive.registerAdapter(BookAdapter());
  await Parse().initialize(
    ServerDatabaseServices().keyApplicationId,
    ServerDatabaseServices().keyParseServerUrl,
    clientKey: ServerDatabaseServices().keyClientKey,
    debug: true,
  );

  await deleteSpicificBook(3);
}

Future<void> addBooksToLibrary() async {
  final bookDatabaseActions = ClientDatabaseServices();
  await bookDatabaseActions.addBook(bookOne);
  await bookDatabaseActions.addBook(bookTwo);
  await bookDatabaseActions.addBook(bookThree);
  await bookDatabaseActions.addBook(bookFour);
}

Future<void> deleteSpicificBook(int index) async {
  final bookDatabaseActions = ClientDatabaseServices();
  await bookDatabaseActions.deleteBook(index);
}

Future<void> deleteAllBooks() async {
  final bookDatabaseActions = ClientDatabaseServices();
  await bookDatabaseActions.deleteAll();
}

void printBookLibrary() async {
  final bookDatabaseActions = ClientDatabaseServices();
  final box = await Hive.openBox<Book>(bookDatabaseActions.hiveBox);
  final books = box.values;
  print(books);
}
