import 'package:api_todo_auth/feature/profile/widget/dark_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/headerWidget.dart';
import '../../../../core/routes/route.dart';
import '../../logic/controller/profile_controller.dart';
import '../../widget/localization_widget.dart';
import '../../widget/logout_widget.dart';
import '../../widget/profile_header_widget.dart';
import '../../widget/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            const HeaderWidget(

              action: [DarkModeWidget()],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 390,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 50),
                  ProfileHeaderWidget(),
                  const SizedBox(height: 60),
                  ProfileWidget(
                    text: 'personalInformation',
                    onTap: () {
                      Get.offNamed(Routes.personalInformation);
                    },
                  ),
                  const LocalizationWidget(),
                  LogOutWidget(
                    profileController: profileController,
                  ),
                ],
              ),
            ),
          ]),
        ),
      );
    });
  }
}
