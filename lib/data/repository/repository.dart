import 'dart:async';

import 'package:api_artikel/data/model/login_model.dart';
import 'package:api_artikel/data/model/register_model.dart';

abstract class Repository {
  FutureOr<LoginModel> postLogin(String username, String password);
  FutureOr<RegisterModel> postRegister(String name,String email, String username,String password,);
}