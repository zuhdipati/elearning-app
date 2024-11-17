import 'package:elearning_app/routes/app_pages.dart';
import 'package:elearning_app/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E Learning Aoo',
      theme: AppTheme.theme,
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}


