import 'package:api_artikel/data/model/show_model.dart';
import 'package:api_artikel/data/repository/repository.dart';
import 'package:api_artikel/data/storage_core.dart';
import 'package:get/get.dart';

class ShowController extends GetxController {
  final repository = Get.find<Repository>();

  ShowModel? showModel;
  final isLoading = false;

  final storage = StorageCore();

  @override
  void onInit() {
    super.onInit();
    showArtikel(Get.arguments);
    update();
  }

  void showArtikel(String id) async {
    try {
      var response = await repository.getShowModel(id);
      showModel=response;
      update();
    } catch(e) {
      return null;
    }
  }
}