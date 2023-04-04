import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FirebaseApp());
}

class FirebaseApp extends StatelessWidget {
  const FirebaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter with Firebase",
      home: BookListScreen(),
    );
  }
}

class BookListScreen extends StatefulWidget {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List<Book> books = [];
  bool gettingBooks = false;

  @override
  void initState() {
    super.initState();
    getAllBooks();
  }
  
  Future<void> getAllBooks() async {
    setState(() {
      gettingBooks = true;
    });
    books.clear();
    await fireStore.collection('Books').get().then((documents) {
      log(documents.docs.length.toString());
      for (var doc in documents.docs) {
        books.add(Book(doc.get('name'), doc.get('writer'), doc.get('year')));
      }
    });
    setState(() {
      gettingBooks = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book List"),
      ),
      body: gettingBooks
          ? const Center(child: CircularProgressIndicator(),)
          : ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(books[index].name),
              subtitle: Text(books[index].authorName),
              trailing: Text(books[index].year),
            );
          }
      )
    );
  }
}

class Book {
  final String name, authorName, year;

  Book(this.name, this.authorName, this.year);
}



