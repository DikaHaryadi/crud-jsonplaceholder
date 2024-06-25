import 'package:example/models/model.dart';
import 'package:example/repository/model1_delete_repo.dart';
import 'package:example/repository/model1_edit_repo.dart';
import 'package:example/repository/model1_get_repo.dart';
import 'package:example/repository/model1_post_repo.dart';
import 'package:example/repository/model1_update_repo.dart';
import 'package:get/get.dart';

class Model1Controller extends GetxController {
  RxList<Model1> model1 = <Model1>[].obs;
  final model1Repo = Get.put(Model1GetRepository());
  final postModel1Repo = Get.put(Model1PostRepository());
  final updateModel1Repo = Get.put(Model1UpdateRepository());
  final editModel1Repo = Get.put(Model1EditRepository());
  final deleteModel1Repo = Get.put(Model1DeleteRepository());
  final isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    fetchModel1Content();
  }

  Future<void> fetchModel1Content() async {
    try {
      isLoading.value = true;
      final models = await model1Repo.fetchModel1Content();
      model1.assignAll(models);
    } catch (e) {
      model1.assignAll([]);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createModel1Content(Model1 model) async {
    try {
      isLoading.value = true;
      final createdModel = await postModel1Repo.postModel1Content(model);
      if (createdModel != null) {
        model1.add(createdModel);
        print('Model created: ${createdModel.userId}');
        print('Model created: ${createdModel.id}');
        print('Model created: ${createdModel.title}');
        print('Model created: ${createdModel.body}');
      } else {
        print('Failed to create model');
      }
    } catch (e) {
      print('Error : $e');
    } finally {
      isLoading.value = false;
    }
  }

  // update
  Future<void> updateModel1Content(Model1 model) async {
    try {
      isLoading.value = true;
      final updatedModel = await updateModel1Repo.updateModel1Content(model);
      if (updatedModel != null) {
        final index = model1.indexWhere((m) => m.id == updatedModel.id);
        if (index != -1) {
          model1[index].updateFromJson(updatedModel.toJson());
        }
        print('Model updated: ${updatedModel.userId}');
        print('Model updated: ${updatedModel.id}');
        print('Model updated: ${updatedModel.title}');
        print('Model updated: ${updatedModel.body}');
      } else {
        print('Failed to update model');
      }
    } catch (e) {
      print('An error occurred while updating model: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // edit
  Future<void> editModel1Content(Model1 model) async {
    try {
      isLoading.value = true;
      final editedModel = await editModel1Repo.editModel1Content(model);
      if (editedModel != null) {
        final index = model1.indexWhere((m) => m.id == editedModel.id);
        if (index != -1) {
          model1[index].updateFromJson(editedModel.toJson());
        }
        print('Model edited: ${editedModel.userId}');
        print('Model edited: ${editedModel.id}');
        print('Model edited: ${editedModel.title}');
        print('Model edited: ${editedModel.body}');
      } else {
        print('Failed to edit model');
      }
    } catch (e) {
      print('An error occurred while editing model: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // delete
  Future<void> deleteModel1Content(String id) async {
    try {
      isLoading.value = true;
      final isDeleted = await deleteModel1Repo.deleteModel1Content(id);
      if (isDeleted) {
        model1.removeWhere((m) => m.id == id);
        print('Model deleted: $id');
      } else {
        print('Failed to delete model');
      }
    } catch (e) {
      print('An error occurred while deleting model: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
