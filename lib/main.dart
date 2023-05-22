import 'package:api_todo_auth/core/localization/controller/localization_controller.dart';
import 'package:api_todo_auth/core/localization/translations/translations_map.dart';
import 'package:api_todo_auth/core/routes/route.dart';
import 'package:api_todo_auth/core/theme/controller/theme_controller.dart';
import 'package:api_todo_auth/core/theme/theme.dart';
import 'package:api_todo_auth/feature/auth/view/screen/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocalizationController());
    return GetMaterialApp(
      title: 'api',
      translations: TranslationsMap(),
      themeMode: ThemeController().themeDataGet,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      locale: controller.initialLang,
      initialRoute: Routes.homeScreen,
      getPages: AppRoutes.routes,

    );
  }
}
