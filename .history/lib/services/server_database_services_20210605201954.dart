import 'dart:convert';

import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:service_database_sync/models/book_model.dart';
import 'package:service_database_sync/models/database_sync_model.dart';

class ServerDatabaseServices {
  final keyApplicationId = 'jVrkUb6tvSheT4NHqGuF9FtFDtQkmqS3pJbKRyLN';
  final keyClientKey = 'MFYPnwLM1d38TtG2523YXxMQ4lCZdX9maovSjrdu';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  Future<void> logCreateEvent(Book book) async {
    final createEvent = DatabaseSyncItem(
      previousBookValue: book,
      updatedBookValue: book,
      dateAdded: book.dateAdded,
      entryAction: DatabaseAction.create,
      lastModified: DateTime.now(),
    );
    final toServer = ParseObject('EventTest')
    ..set('previousBookValue', createEvent.previousBookValue.toString())
    ..set('updatedBookValue', createEvent.updatedBookValue.toString())
    ..set('dateAdded', createEvent.dateAdded)
    ..set('entryAction', createEvent.entryAction
    ..set('lastModified', createEvent.lastModified.toString());
    await toServer.save();
  }
}
