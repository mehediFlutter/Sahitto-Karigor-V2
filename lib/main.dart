import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sahitto_karigor/new_design/app_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppMaterialApp());
}
