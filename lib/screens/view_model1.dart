import 'package:example/controllers/model1_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewModel1 extends StatelessWidget {
  const ViewModel1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Model1Controller());
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.model1.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (_, index) {
                final modelData = controller.model1[index];
                return Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User ID: ${modelData.userId}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text('ID: ${modelData.id}'),
                      SizedBox(height: 5),
                      Text('Title: ${modelData.title}'),
                      SizedBox(height: 5),
                      Text('Body: ${modelData.body}'),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemCount: controller.model1.length,
            );
          }
        }),
      ),
    );
  }
}
