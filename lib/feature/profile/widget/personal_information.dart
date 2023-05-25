import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/text_field_widget.dart';
import '../../../core/constant/keys.dart';
import '../../auth/logic/controller/auth_controller.dart';
import '../../auth/model/user.dart';
import '../logic/controller/profile_controller.dart';

class PersonalInformationWidget extends StatelessWidget {
  PersonalInformationWidget({Key? key, required this.profileController})
      : super(key: key);
  final ProfileController profileController;
  AuthController authController = Get.find<AuthController>();
  User? user;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    profileController.emailController.text = GetStorage().read(
      AppKeys.emailKey,
    );
    profileController.nameController.text = GetStorage().read(AppKeys.nameKey);
    profileController.phoneController.text =
        GetStorage().read(AppKeys.phoneKey);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(height: 50),
          Text(
            'personal Information',
            style: theme.bodyLarge,
          ),
          const SizedBox(height: 50),
          TextFieldWidget(
            controller: profileController.nameController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.person,
            ),
            label: 'fullName'.tr,
          ),
          TextFieldWidget(
            enabled: false,
            controller: profileController.emailController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.email,
            ),
            label: 'email'.tr,
          ),
          TextFieldWidget(
            enabled: false,
            controller: profileController.phoneController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.phone_android,
            ),
            label: 'phoneNum'.tr,
          ),
          ElevatedButton(
              onPressed: () async {
                // await profileController.updateUserName(
                //     userName: profileController.nameController.text);

                var data = User(
                  id: user?.id,
                  email: authController.emailController.text,
                  // phoneNum: int.parse(authController.phoneController.text),
                  name: authController.nameController.text,
                );
                var respone = await profileController.updateData(data);
                print(respone);
                print(user!.id);
              },
              child: Text('edit'.tr)),
        ]);
  }
}
