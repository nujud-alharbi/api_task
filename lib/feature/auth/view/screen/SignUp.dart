import 'package:api_todo_auth/feature/auth/logic/controller/auth_controller.dart';
import 'package:api_todo_auth/feature/auth/model/user.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/route.dart';
import '../widget/form_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
              FormFieldSignUpWidget(),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var data = User(
                        name: authController.nameController.text,
                        email: authController.emailController.text,
                        phoneNum: int.parse(
                          authController.phoneController.text,
                        ),
                        birthDate: authController.newDate,
                      );
                      await authController.postData(data);

                      Get.toNamed(Routes.homeScreen);
                    }
                    authController.clearController();
                  },
                  child: const Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
