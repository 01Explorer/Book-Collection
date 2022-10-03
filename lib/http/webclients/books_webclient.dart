import 'dart:collection';
import 'dart:convert';

import 'package:book_search/http/webclient.dart';
import 'package:book_search/models/book.dart';
import 'package:http/http.dart';

class BookWebClient {
  Future<List<Book>> searchName() async {
    final Response response = await client.get(baseUrl);
    LinkedHashMap<String, dynamic> firstStep = jsonDecode(response.body);
    Map<String, dynamic> stringMap = firstStep.cast<String, dynamic>();
    List<dynamic> infos = stringMap['items'];
    return infos.map((dynamic json) => Book.fromJson(json)).toList();
    // return Book.fromJson(stringMap['items']);
  }
}
