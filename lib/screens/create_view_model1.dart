import 'package:example/screens/edit_view_model1.dart';
import 'package:example/screens/update_view_model1.dart';
import 'package:example/screens/view_model1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/controllers/model1_controller.dart';
import 'package:example/models/model.dart';

class CreateModel1View extends StatelessWidget {
  const CreateModel1View({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Model1Controller());

    final TextEditingController userIdController = TextEditingController();
    final TextEditingController idController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Create Model1')),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final newModel = Model1(
                      userId: userIdController.text,
                      id: idController.text,
                      title: titleController.text,
                      body: bodyController.text,
                    );
                    controller.createModel1Content(newModel);
                  },
                  child: Text('Create'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => Get.to(() => ViewModel1()),
                  child: Text('Tampilkan'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => Get.to(() => UpdateModel1View()),
                  child: Text('Update'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Get.to(() => EditModel1View()),
                  child: Text('Edit'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    final idToDelete = '1';
                    controller.deleteModel1Content(idToDelete);
                  },
                  child: Text('Delete Model1'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
