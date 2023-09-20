import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/book.dart';

class BookDBService {

  //collection reference
  final CollectionReference bookCollection = FirebaseFirestore.instance.collection('books');

  //get book stream
  Stream<List<Book>> get books{
    return bookCollection.snapshots().map(_bookListFromSnapshot);
  }

  //book list from snapshot
  List<Book> _bookListFromSnapshot (QuerySnapshot snapshot){
    try{
      return snapshot.docs.map((doc){
        return Book(
          name: doc.get('name') ?? '',
          author: doc.get('author') ?? '',
          category: doc.get('category') ?? '',
          description: doc.get('description') ?? '',
          imageUrl: doc.get('imageUrl') ?? '',
        );
      }).toList();
      }
      catch(e){
        print(e.toString());
        return [];
      }
    }
}