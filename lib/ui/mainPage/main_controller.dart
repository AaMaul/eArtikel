import 'package:api_artikel/data/model/list_artikel_model.dart';
import 'package:api_artikel/data/repository/repository.dart';
import 'package:api_artikel/data/storage_core.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final repository = Get.find<Repository>();

  ListArtikelModel? listArtikelModel;

  final storage = StorageCore();

  @override
  void onInit() {
    super.onInit();
    getArtikel(storage.getAccessToken()??'');
  }

  void getArtikel(String token)async{
    try{
      var res = await repository.getListArtikelModel(token);
      listArtikelModel=res;
      update();
    }catch(e){
      return null;
    }
  }

}