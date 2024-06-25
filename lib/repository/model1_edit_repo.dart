import 'dart:convert';

import 'package:example/models/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Model1EditRepository extends GetxController {
  Future<Model1?> editModel1Content(Model1 model) async {
    try {
      final uri =
          Uri.parse('https://jsonplaceholder.typicode.com/posts/${model.id}');
      final response = await http.patch(
        uri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        return Model1.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to edit data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }
}
