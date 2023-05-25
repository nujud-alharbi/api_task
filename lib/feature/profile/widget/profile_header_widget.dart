import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/constant/keys.dart';
import '../../../core/theme/app_colors.dart';
import '../logic/controller/profile_controller.dart';

class ProfileHeaderWidget extends StatelessWidget {
  ProfileHeaderWidget({
    Key? key,
  }) : super(key: key);

  ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: lightColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppImages.profileImage) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            GetStorage().read(AppKeys.nameKey),
            style: theme.headlineLarge,
          ),
          Text(
            (GetStorage().read(AppKeys.emailKey)),
            style: theme.headlineSmall,
          ),
          Text(
            '+966 5' + (GetStorage().read(AppKeys.phoneKey)),
            style: theme.headlineSmall,
          ),
          Text(
            profileController.formateDate(),
            style: theme.headlineSmall,
          ),
        ],
      ),
    );
    // });
  }
}
