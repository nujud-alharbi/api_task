
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/dialoge_widget.dart';
import '../logic/controller/profile_controller.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({Key? key,
   // required this.profileController
  })
      : super(key: key);
   // final ProfileController profileController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return DialogWidget(
      title: 'pleaseConfirm'.tr,
      content: "AreYouSureToLogOut".tr,
      textButton: 'logoutDialogHeading'.tr,
      onPressed: () {
        // profileController.signOut();
      },
      child: Text(
        "logoutDialogHeading".tr,
        style: theme.headlineMedium,
      ),
    );
  }
}
