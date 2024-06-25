import 'dart:convert';
import 'package:example/models/model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class Model1UpdateRepository extends GetxController {
  Future<Model1?> updateModel1Content(Model1 model) async {
    try {
      final uri =
          Uri.parse('https://jsonplaceholder.typicode.com/posts/${model.id}');
      final response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        return Model1.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to update data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }
}
