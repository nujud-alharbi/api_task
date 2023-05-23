import 'package:api_todo_auth/feature/auth/logic/service/auth_service.dart';
import 'package:api_todo_auth/feature/profile/logic/service/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/api_string.dart';
import '../../../auth/model/user.dart';

class ProfileController extends GetxController{


  bool isLoading = false;

  bool isDarkTheme = false;


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();



  final profileiService = ProfileService();


  final Map<String, String> headers = {
    'Access-Control-Allow-Origin': '*',
    'Content-type': 'application/json',
    'Accept': '*/*',
  };

  refreshData() {
    getAllData();
    update();
  }

  @override
  onInit() async {
    super.onInit();
    await getAllData();
  }

  // clearController() {
  //   titleController.clear();
  //   descriptionController.clear();
  // }

  Future<List<User>> getAllData() async {
    List todoList =
    await profileiService.getData(url: ApiString.baseUrl, headers: headers);
    return todoList.map((todo) => User.fromJson(todo)).toList();
  }
getData() async {
 var data = await profileiService.getData(
      url:  ApiString.baseUrl,
      headers: headers) ;


}


  updateData(User model) async {
    await profileiService.updateData(
      url: ApiString.baseUrl,
      id: "${model.id}",
      body: {
        'email': model.email,
        'name': model.name,
        'phone_num': model.phoneNum,
      },
      headers: headers,
    );
  }

  deleteData(String id) async {
    await profileiService.deleteData(url: ApiString.baseUrl, id: id);
  }
}