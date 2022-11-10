import 'dart:async';
import 'dart:io';

import 'package:api_artikel/data/model/deleted_artikel_model.dart';
import 'package:api_artikel/data/model/list_artikel_model.dart';
import 'package:api_artikel/data/model/login_model.dart';
import 'package:api_artikel/data/model/logout_model.dart';
import 'package:api_artikel/data/model/register_model.dart';
import 'package:api_artikel/data/model/show_model.dart';
import 'package:api_artikel/data/model/update_artikel_model.dart';
import '../model/post_artikel_model.dart';

abstract class Repository {
  FutureOr<LoginModel> postLogin(String username, String password);
  FutureOr<RegisterModel> postRegister(String name,String email, String username,String password,);
  FutureOr<ListArtikelModel> getListArtikelModel();
  FutureOr<ShowModel> getShowModel(String id);
  FutureOr<PostArtikelModel> postArtikelModel (String  title,String content, File? image);
  FutureOr<DeletedArtikelModel> deletedArtikelModel(String id);
  FutureOr<LogoutModel> logoutModel (String username, String password);
  FutureOr<UpdateArtikelModel> updateArtikelModel(String id, String title, String content, File? image, String token);
}