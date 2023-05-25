import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/controller/theme_controller.dart';
import '../logic/controller/profile_controller.dart';

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GetBuilder<ProfileController>(builder: (initialController) {
      return IconButton(
          icon: Icon(
            Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            size: 30,
            color: Get.isDarkMode ? whiteColor : blackColor,
          ),
          onPressed: () {
            ThemeController().changesTheme();
            initialController.isDarkTheme =
                ThemeController().getThemeDataFromBox();
            initialController.getData();

            Get.snackbar(
              'Successful',
              'App Theme Changed',
            );
          });
    });
  }
}
