import 'package:api_todo_auth/feature/auth/logic/controller/auth_controller.dart';
import 'package:api_todo_auth/feature/auth/model/user.dart';
import 'package:api_todo_auth/feature/crud/logic/controller/todoController.dart';
import 'package:api_todo_auth/feature/profile/view/screen/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/text_field_widget.dart';
import '../../../../core/constant/keys.dart';
import '../../../../core/routes/route.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    print("pppp");

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
                Icons.phone_android,
              ),
              label: 'Phone',
            ),





            const SizedBox(
              height: 15,
            ),



            GetBuilder<AuthController>(builder: (_) {
                return SizedBox(
                    width: 480,
                    child: OutlinedButton(onPressed: () {
                      authController.chooseDate();

                    }, child:


                    Padding(
                      padding: const EdgeInsets.only(right: 20.0 ,left: 20.0),
                      child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Icon(Icons.arrow_back_ios),

                          Text( authController.isDate?
                          authController.dateButton: "kkk" ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    )));
              }
            ),
            const SizedBox(
              height: 15,
            ),



            ElevatedButton(
                onPressed: () async {
                  var data = User(
                      name: authController.nameController.text,
                      email: authController.emailController.text,
                      phoneNum: int.parse(authController.phoneController.text

                      ), id: authController.emailController.text,
                  birthDate:authController.dattta);
                  await authController.postData(data);
await GetStorage().write(AppKeys.authKey,data.id);

                  Get.toNamed(Routes.homeScreen);
                },
                child: const Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
