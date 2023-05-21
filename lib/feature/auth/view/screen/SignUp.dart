import 'package:api_todo_auth/feature/auth/logic/controller/auth_controller.dart';
import 'package:api_todo_auth/feature/auth/model/user.dart';
import 'package:api_todo_auth/feature/profile/view/screen/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/text_field_widget.dart';
import '../../../../core/routes/route.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(

        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Create Account"),
            SizedBox(
              height: 60,
            ),
            TextFieldWidget(
              controller: authController.emailController,
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
              prefixIcon: const Icon(
                Icons.email_outlined,
              ),
              label: 'Phone',
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                width: 480,
                child: TextButton(onPressed: () {}, child: Text("Date"))),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () async {
                  var data = User(
                      name: authController.nameController.text,
                      email: authController.emailController.text,
                      phoneNum: int.parse(authController.phoneController.text));
                  await authController.postData(data);

                  Get.toNamed(Routes.profileScreen);
                },
                child: const Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
