import 'package:flutter/material.dart';

import '../../models/book.dart';

class BookTile extends StatelessWidget {

  final Book book;
  const BookTile({required this.book,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Image.network( book.imageUrl,scale: 10.0,),
          title: Text(book.name),
          subtitle: Text(book.author),
        )
      )
      );
  }
}