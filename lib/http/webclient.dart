import 'package:book_search/http/interceptors/interceptors.dart';
import 'package:http_interceptor/http/http.dart';

final InterceptedClient client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 15),
);

var baseUrl = Uri.https(
    'www.googleapis.com', '/books/v1/volumes', {'q': '', 'maxResults': '2'});

void setUrl(String nome) {
  baseUrl = Uri.https('www.googleapis.com', '/books/v1/volumes', {
    'q': nome,
    'maxResults': '40',
  });
}
