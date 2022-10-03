import 'package:book_search/models/book.dart';
import 'package:book_search/models/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDescription extends StatelessWidget {
  final Book book;
  const BookDescription({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 47, 250),
        title: Text(
          Provider.of<BookProvider>(context, listen: false).bookName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(book.thumbnail!),
                    fit: BoxFit.cover,
                    opacity: 0.15),
              ),
              child: ClipRRect(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: Image.network(book.thumbnail!),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Text(
                        book.title,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      book.nameAuthors(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Publisher: ${book.publisher}',
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            'Published Date: ${book.publishedDate}',
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            'Number of Pages: ${book.pageCount}',
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 67, 47, 250),
                      child: const Center(
                        child: Text(
                          'Description',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        book.description != null
                            ? book.description!
                            : 'There\'s no available description for this book',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 67, 47, 250),
                      child: const Center(
                        child: Text(
                          'Sales Information',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        book.forSale!
                            ? 'Available for R\$${book.price}'
                            : 'Edition Unavailable for purchase',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
