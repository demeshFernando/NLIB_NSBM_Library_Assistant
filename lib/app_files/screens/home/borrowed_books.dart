import 'package:flutter/material.dart';
import 'package:nlib_library_assistant/app_files/models/book.dart';
import 'package:nlib_library_assistant/app_files/services/bookDatabase.dart';
import 'package:provider/provider.dart';

import 'book_list.dart';

class BorrowedBooks extends StatefulWidget {
  const BorrowedBooks({super.key});

  @override
  _BorrowedBooks createState() => _BorrowedBooks();
}

class _BorrowedBooks extends State<BorrowedBooks> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Book>?>.value(
      value: BookDBService().books,
      initialData: [],
      child: Container(
        child: BookList(),
      ),
    );
  }
}
