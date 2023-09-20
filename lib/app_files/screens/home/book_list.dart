import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book.dart';
import 'book_tile.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {

    //getting the books from the provider in dashboard.dart
    final books = Provider.of<List<Book>?> (context) ?? [];

    //returning the list of books
    return ListView.builder(
      itemCount: books.length,
      itemBuilder:(context, index){
        return BookTile(book: books[index]);
      });
  }
}