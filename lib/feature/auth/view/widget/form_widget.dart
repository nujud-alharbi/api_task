import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/text_field_widget.dart';
import '../../../../core/constant/validation.dart';

import '../../../../core/theme/app_colors.dart';
import '../../logic/controller/auth_controller.dart';

class FormFieldSignUpWidget extends StatelessWidget {
  FormFieldSignUpWidget({Key? key}) : super(key: key);

  final authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Create Account", style: theme.bodyLarge),
        const SizedBox(
          height: 60,
        ),
        TextFieldWidget(
          controller: authController.emailController,
          validator: (value) {
            if (value.toString().isEmpty) {
              return "Please enter email";
            } else if (!RegExp(Validation.validationEmail).hasMatch(value)) {
              return "Please enter a correct email address";
            } else {
              return null;
            }
          },
          obscureText: false,
          prefixIcon: const Icon(
            Icons.email_outlined,
          ),
          label: 'email',
          hintText: "example@example.com",
        ),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
            controller: authController.nameController,
            obscureText: false,
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'Enter your Nameame';
              } else if (!RegExp(Validation.validationName).hasMatch(value)) {
                return "Please enter a correct Name";
              } else if (value.toString().length < 2) {
                return 'Your Name should be at least 2 long ';
              } else {
                return null;
              }
            },
            prefixIcon: const Icon(
              Icons.person,
            ),
            label: "Name",
            hintText: "hello"),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
          controller: authController.phoneController,
          obscureText: false,
          validator: (value) {
            if (value.toString().isEmpty) {
              return 'Enter your phone number'.tr;
            } else if (!RegExp(Validation.validationNumber).hasMatch(value)) {
              return "Please enter a correct phone number".tr;
            } else if (value.toString().length < 8 ||
                value.toString().length > 8) {
              return 'sorry, must enter 8 number'.tr;
            } else {
              return null;
            }
          },
          prefixIcon: const Icon(
            Icons.phone_android,
          ),
          label: 'Phone',
          hintText: "05xxxxxxxx",
        ),
        const SizedBox(
          height: 15,
        ),
        GetBuilder<AuthController>(builder: (_) {
          return SizedBox(
              width: 480,
              height: 40,
              child: OutlinedButton(
                  onPressed: () {
                    authController.chooseDate();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: blueColor,
                        ),
                        Text(
                          authController.isDate
                              ? authController.changeTextDate
                              : "Date",
                          style: theme.bodyLarge,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: blueColor,
                        ),
                      ],
                    ),
                  ))
              // ),
              );
        }),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
