import 'dart:async';

import 'package:api_artikel/data/model/list_artikel_model.dart';
import 'package:api_artikel/data/model/login_model.dart';
import 'package:api_artikel/data/model/register_model.dart';
import 'package:api_artikel/data/model/show_model.dart';
import '../model/post_artikel_model.dart';

abstract class Repository {
  FutureOr<LoginModel> postLogin(String username, String password);
  FutureOr<RegisterModel> postRegister(String name,String email, String username,String password,);
  FutureOr<ListArtikelModel> getListArtikelModel(String token);
  FutureOr<ShowModel> getShowModel(int id, String token);
  FutureOr<PostArtikelModel> postArtikelModel (String  title,String content, String image, String token);
}