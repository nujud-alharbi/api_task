import 'package:api_todo_auth/feature/auth/logic/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../core/constant/api_string.dart';
import '../../../../core/constant/keys.dart';
import '../../model/user.dart';

class AuthController extends GetxController {
  //properties
  final apiService = AuthService();

  var baseUrl = ApiString.baseUrl;
  GetStorage authStorage = GetStorage();
  var selectedDate = DateTime.now().obs;
  String changeTextDate = DateTime.now().obs.toString();
  bool isDate = false;
  late int newDate;

  //text controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final Map<String, String> headers = {
    'Access-Control-Allow-Origin': '*',
    'Content-type': 'application/json',
    'Accept': '*/*',
  };

  clearController() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    changeTextDate = "brith date";
  }

  postData(User model) async {
    await apiService.postData(
      url: '$baseUrl/user',
      body: {
        'email': model.email,
        'name': model.name,
        'phone_num': model.phoneNum,
        "id": model.id,
        'birth_date': model.birthDate,
      },
      headers: headers,
    );

    GetStorage().write(AppKeys.emailKey, "${model.email}");
    GetStorage().write(AppKeys.nameKey, "${model.name}");
    GetStorage().write(AppKeys.phoneKey, "${model.phoneNum}");
    GetStorage().write(AppKeys.brithDateKey, "${model.birthDate}");
  }





  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime.now());

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      changeTextDate = DateFormat.yMMMd().format(selectedDate.value).toString();

      String date = selectedDate.value.toString();
      newDate = DateTime.parse(date).millisecondsSinceEpoch;

      isDate = true;
      update();
    }

  }
}
