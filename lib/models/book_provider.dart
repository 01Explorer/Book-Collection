import 'package:book_search/http/webclient.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  String bookName;

  BookProvider(
    this.bookName,
  );

  setBookName(String value) {
    bookName = value;
    setUrl(bookName);
  }
}
