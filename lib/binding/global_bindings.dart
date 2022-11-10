import 'package:api_artikel/data/network_core.dart';
import 'package:api_artikel/data/repository/repository.dart';
import 'package:api_artikel/data/repository/repository_impl.dart';
import 'package:api_artikel/data/storage_core.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<StorageCore>(StorageCore());
    Get.put<NetworkCore>(NetworkCore());
    Get.put<Repository>(RepositoryImpl());
  }
}