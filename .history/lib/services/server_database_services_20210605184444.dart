import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:service_database_sync/models/book_model.dart';
import 'package:service_database_sync/models/database_sync_model.dart';

class ServerDatabaseServices {
  final keyApplicationId = 'jVrkUb6tvSheT4NHqGuF9FtFDtQkmqS3pJbKRyLN';
  final keyClientKey = 'MFYPnwLM1d38TtG2523YXxMQ4lCZdX9maovSjrdu';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  void logCUDEvent(DatabaseAction eventType, Book book) {
    final event = DatabaseSyncItem(
      previousBookValue: null,
      updatedBookValue: book,
      dateAdded: book.dateAdded,
      entryAction: eventType,
      lastModified: DateTime.now(),
    );
    ParseObject('Event')..set('previousValue', event.previousBookValue)..set('updatedBookValue', event.updatedBookValue)..set('dateAdded', value);
  }
}
