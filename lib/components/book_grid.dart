import 'package:book_search/models/book.dart';
import 'package:book_search/screens/details.dart';
import 'package:flutter/material.dart';

class BookGrid extends StatelessWidget {
  const BookGrid({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDescription(
              book: book,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              width: 2,
            )),
        margin: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Image.network(
            book.thumbnail!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
