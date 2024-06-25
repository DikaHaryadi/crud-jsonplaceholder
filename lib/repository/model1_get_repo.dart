import 'dart:convert';

import 'package:example/models/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Model1GetRepository extends GetxController {
  Future<List<Model1>> fetchModel1Content() async {
    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        List<Model1> modelList =
            (result as List).map((json) => Model1.fromJson(json)).toList();
        return modelList;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
