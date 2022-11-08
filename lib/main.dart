import 'package:api_artikel/artikel_application.dart';
import 'package:api_artikel/binding/global_bindings.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GlobalBindings().dependencies();
  runApp(const ArtikelApplication());

}
