import 'package:book_search/components/background_container.dart';
import 'package:book_search/components/book_grid.dart';
import 'package:book_search/components/centered_message.dart';
import 'package:book_search/http/webclients/books_webclient.dart';
import 'package:book_search/models/book.dart';
import 'package:book_search/models/book_provider.dart';
import 'package:book_search/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final BookWebClient _webClient = BookWebClient();
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
      body: BackgroundContainer(
        FutureBuilder<List<Book>>(
          future: _webClient.searchName(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const Loading();
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<Book> books = snapshot.data;
                  if (books.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          final Book book = books[index];
                          return BookGrid(book: book);
                        },
                        itemCount: books.length,
                      ),
                    );
                  }
                }
                return const CenteredMessage(
                  'Data not found',
                  icon: Icons.warning_amber_rounded,
                );
            }
            return const CenteredMessage('Unknown Error');
          },
        ),
      ),
    );
  }
}
