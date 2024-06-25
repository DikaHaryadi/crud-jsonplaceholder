import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/controllers/model1_controller.dart';
import 'package:example/models/model.dart';

class UpdateModel1View extends StatelessWidget {
  const UpdateModel1View({super.key});

  @override
  Widget build(BuildContext context) {
    final Model1Controller controller = Get.find<Model1Controller>();

    final TextEditingController userIdController = TextEditingController();
    final TextEditingController idController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Update Model1')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userIdController,
              decoration: InputDecoration(labelText: 'User ID'),
            ),
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  final updatedModel = Model1(
                    userId: userIdController.text,
                    id: idController.text,
                    title: titleController.text,
                    body: bodyController.text,
                  );
                  controller.updateModel1Content(updatedModel);
                },
                child: controller.isLoading.value == true
                    ? const CircularProgressIndicator()
                    : Text('Update')),
          ],
        ),
      ),
    );
  }
}
