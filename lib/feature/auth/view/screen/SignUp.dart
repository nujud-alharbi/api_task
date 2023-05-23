import 'package:api_todo_auth/core/theme/app_colors.dart';
import 'package:api_todo_auth/feature/auth/logic/controller/auth_controller.dart';
import 'package:api_todo_auth/feature/auth/model/user.dart';
import 'package:api_todo_auth/feature/crud/logic/controller/todoController.dart';
import 'package:api_todo_auth/feature/profile/view/screen/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/dialoge_widget.dart';
import '../../../../common/text_field_widget.dart';
import '../../../../core/constant/keys.dart';
import '../../../../core/constant/validation.dart';
import '../../../../core/routes/route.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),

      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, right: 30, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Create Account" ,style: theme.bodyLarge),
              const SizedBox(
                height: 60,
              ),
              TextFieldWidget(
                controller: authController.emailController,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Please enter email";
                  } else if (!RegExp(Validation.validationEmail)
                      .hasMatch(value)) {
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
                  } else if (!RegExp(Validation.validationName)
                      .hasMatch(value)) {
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
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                controller: authController.phoneController,
                obscureText: false,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Enter your phone number'.tr;
                  } else if (!RegExp(Validation.validationNumber)
                      .hasMatch(value)) {
                    return "Please enter a correct phone number".tr;
                  } else if (value.toString().length < 10 ||
                      value.toString().length > 10) {
                    return 'sorry, invalid phone number'.tr;
                  } else {
                    return null;
                  }
                },
                prefixIcon: const Icon(
                  Icons.phone_android,
                ),
                label: 'Phone',
                text: "05xxxxxxxx",
              ),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<AuthController>(builder: (_) {
                return SizedBox(
                    width: 480,
                    child: OutlinedButton(
                        onPressed: () {
                          authController.chooseDate();
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 20.0, left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.arrow_back_ios,color: blueColor,),
                              Text(authController.isDate
                                  ? authController.dateButton
                                  : "Date",style: theme.bodyLarge,),
                              Icon(Icons.arrow_forward_ios ,color: blueColor,),
                            ],
                          ),
                        )));
              }),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () async {

                    if (formKey.currentState!.validate()) {

                      var data = User(
                          name: authController.nameController.text,
                          email: authController.emailController.text,
                          phoneNum:
                              int.parse(authController.phoneController.text),
                          id: authController.emailController.text,
                          birthDate: authController.dattta);
                      await authController.postData(data);
                      await GetStorage().write(AppKeys.authKey, data.id);

                      Get.toNamed(Routes.homeScreen);
                    }

                    },

                  child: const Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
