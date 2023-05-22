
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/text_field_widget.dart';
import '../logic/controller/profile_controller.dart';

class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({Key? key,
    required this.profileController
  }
      )
      : super(key: key);
 final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(height: 50),
          Text(
            'personalInformation'.tr,
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
              onPressed: ()  {
                // await profileController.updateUserName(
                //     userName: profileController.nameController.text);
              },
              child: Text('edit'.tr)),

        ]);
  }
}
