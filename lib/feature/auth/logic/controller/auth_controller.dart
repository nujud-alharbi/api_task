import 'package:api_todo_auth/feature/auth/logic/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/api_string.dart';
import '../../model/user.dart';

class AuthController extends GetxController{

  final apiService = AuthService();


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
  }


  postData(User model) async {
    await apiService.postData(
      url: ApiString.baseUrl,
      body: {
        'email': model.email,
        'name': model.name,
        'phone_num': model.phoneNum,
      },
      headers: headers,
    );
  }




}

