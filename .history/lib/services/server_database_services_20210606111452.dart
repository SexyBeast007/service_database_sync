import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:service_database_sync/models/book_model.dart';
import 'package:service_database_sync/models/database_sync_model.dart';

class ServerDatabaseServices {
  final keyApplicationId = 'jVrkUb6tvSheT4NHqGuF9FtFDtQkmqS3pJbKRyLN';
  final keyClientKey = 'MFYPnwLM1d38TtG2523YXxMQ4lCZdX9maovSjrdu';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  ///
  ///
  /// CREATION LOG EVENT
  Future<void> logCreateEvent(Book book) async {
    final createEvent = DatabaseSyncItem(
      previousBookValue: null,
      updatedBookValue: book,
      dateAdded: book.dateAdded,
      entryAction: DatabaseAction.create,
      lastModified: DateTime.now(),
    );
    final toServer = ParseObject('Event')
      ..set('previousBookValue', createEvent.previousBookValue.toJson())
      ..set('updatedBookValue', createEvent.updatedBookValue.toJson())
      ..set('dateAdded', createEvent.dateAdded)
      ..set('entryAction', createEvent.entryAction.toString())
      ..set('lastModified', createEvent.lastModified);
    await toServer.save();
  }

  ///
  ///
  /// UPDATE LOG EVENT
  Future<void> logEditEvent(Book previousValue, Book updatedValue) async {
    updatedValue.lastModified = DateTime.now();
    final createEvent = DatabaseSyncItem(
      previousBookValue: previousValue,
      updatedBookValue: updatedValue,
      dateAdded: previousValue.dateAdded,
      entryAction: DatabaseAction.update,
      lastModified: DateTime.now(),
    );
    final toServer = ParseObject('Event')
      ..set('previousBookValue', createEvent.previousBookValue.toJson())
      ..set('updatedBookValue', createEvent.updatedBookValue.toJson())
      ..set('dateAdded', createEvent.dateAdded)
      ..set('entryAction', createEvent.entryAction.toString())
      ..set('lastModified', createEvent.lastModified);
      await toServer.save();
  }

  ///
  ///
  /// DELETE LOG EVENT
  Future<void> logDeleteEvent(Book book) {

  }
}
