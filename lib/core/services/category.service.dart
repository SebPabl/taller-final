import 'dart:convert';
import 'package:taller_final/core/classes/category.class.dart';
import 'package:taller_final/core/client/http_custom.client.dart';

class CategoryService {
  final String apiUrl = "https://stslab.qhanati.com/websda/api";
  final HttpClient httpClient = HttpClient();

  Future<List<Category>> getCategories() async {
    var url = Uri.parse('$apiUrl/sda/getCategoria');

    final response = await httpClient.post(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<Category> categories = jsonData.map((json) => Category.fromJson(json)).toList();
      return categories;
    } else {
      throw Exception('Failed to load Categories');
    }
  }
}
