import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Model1DeleteRepository extends GetxController {
  Future<bool> deleteModel1Content(String id) async {
    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
      final response = await http.delete(uri);

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to delete data: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }
}
