import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/controllers/model1_controller.dart';
import 'package:example/models/model.dart';

class EditModel1View extends StatelessWidget {
  const EditModel1View({super.key});

  @override
  Widget build(BuildContext context) {
    final Model1Controller controller = Get.put(Model1Controller());

    final TextEditingController userIdController = TextEditingController();
    final TextEditingController idController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Edit Model1')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userIdController,
              decoration: InputDecoration(labelText: 'UserId'),
            ),
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Id'),
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
                final editedModel = Model1(
                  id: idController.text,
                  title: titleController.text,
                  body: bodyController.text,
                  userId: userIdController.text,
                );
                controller.editModel1Content(editedModel);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
