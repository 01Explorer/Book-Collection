class Book {
  final String title;
  final List<dynamic> author;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final String? thumbnail;
  final bool? forSale;
  final double? price;

  Book(
      this.title,
      this.author,
      this.publisher,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.thumbnail,
      this.forSale,
      this.price);

  Book.fromJson(Map<String, dynamic> json)
      : title = json['volumeInfo']['title'],
        author = [json['volumeInfo']['authors']],
        publisher = json['volumeInfo']['publisher'],
        publishedDate = json['volumeInfo']['publishedDate'],
        description = json['volumeInfo']['description'],
        pageCount = json['volumeInfo']['pageCount'],
        thumbnail = json['volumeInfo']['imageLinks'] != null
            ? json['volumeInfo']['imageLinks']['thumbnail']
            : 'http://blog.hopuyoga.com.br/wp-content/themes/seri-e-design/assets/images/no-image.png',
        forSale = json['saleInfo']['saleability'] == 'FOR_SALE',
        price = json['saleInfo']['listPrice'] != null
            ? (json['saleInfo']['listPrice']['amount']).toDouble()
            : 0.0;

  String nameAuthors() {
    String authors = '';
    for (var name in author) {
      authors += name.toString();
    }
    return authors.replaceAll('[', '').replaceAll(']', ' ');
  }
}
