import 'package:service_database_sync/models/book_model.dart';

  DateTime now = DateTime.now();
  List<Book> library = [
    Book(
      title: 'The ghost of the barn',
      author: 'Kosmas Brink',
      publishingDate: DateTime(1998, 11, 2),
      dateAdded: DateTime.now(),
      lastModified: DateTime.now(),
    )
  ];

