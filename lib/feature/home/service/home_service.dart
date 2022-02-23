import 'package:http/http.dart' as http;

import '../model/home_model.dart';

class HomeService {
  Future<List<HomeModel>> fetchPost() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts?userId=1"));

    if (response.statusCode == 200) {
      return homeModelFromJson(response.body);
    } else {
      throw Exception("Oh no!. We have a problem.");
    }
  }
}
