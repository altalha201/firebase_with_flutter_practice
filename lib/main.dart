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

  final TextEditingController _nameET = TextEditingController();
  final TextEditingController _authorET = TextEditingController();
  final TextEditingController _yearET = TextEditingController();

/*  @override
  void initState() {
    super.initState();
    // getAllBooks();
  }*/
  
  /*Future<void> getAllBooks() async {
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
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book List"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStore.collection("Books").snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }
          if (snapshots.hasError) {
            return Center(
              child: Text(snapshots.error.toString()),
            );
          }
          if (snapshots.hasData) {
            books.clear();
            for (var doc in snapshots.data!.docs) {
              books.add(
                Book(doc.get('name'), doc.get('writer'), doc.get('year'))
              );
            }

            books.sort((a, b) => a.year.compareTo(b.year));

            return ListView.builder(
              itemCount: books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(books[index].name),
                    subtitle: Text(books[index].authorName),
                    trailing: Text(books[index].year),
                  );
                }
            );
          } else {
            return const Center(
              child: Text("No Books Found"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameET,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: "Book name"
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: _authorET,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Book author"
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: _yearET,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Book publishing year"
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            await fireStore.collection("Books").doc().set({
                              'name' : _nameET.text,
                              'writer' : _authorET.text,
                              'year' : _yearET.text,
                            });

                            _nameET.clear();
                            _yearET.clear();
                            _authorET.clear();
                            Navigator.pop(context);
                          },
                          child: const Text("Add Book"),
                        ),
                      )
                    ],
                  ),
                );
              }
          );
        },
      ),
    );
  }
}

class Book {
  final String name, authorName, year;

  Book(this.name, this.authorName, this.year);
}



