import 'package:api_todo_auth/feature/auth/logic/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../core/constant/api_string.dart';
import '../../../../core/constant/keys.dart';
import '../../model/user.dart';

class AuthController extends GetxController{

  final apiService = AuthService();
  GetStorage authStorage = GetStorage();
  var selectedDate = DateTime.now().obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();




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
        // 'id': model.id
      },
      headers: headers,
    );

    print("kkkkk");
    GetStorage().write("k", model.id);
    print(GetStorage().read("k"));



  }


  bool isDate = false;
 late int dattta   ;

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        // selectableDayPredicate: disableDate,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.white, // <-- SEE HERE
                // onPrimary: mainColor, // <-- SEE HERE
                // onSurface: mainColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  // primary: mainColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        });

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      dateController.text =
          DateFormat.yMMMd().format(selectedDate.value).toString();
      var r = dateController.text;
      //---------------------------------
      // dateController!.text =
      //     DateFormat.yMMMd().format(DateTime.now());

      //-------------------
String d  =  selectedDate.value.toString() ;
dattta = DateTime.parse(d).millisecondsSinceEpoch;


      print(dateController.text);
      print("pppp");
      print(dattta);
      isDate = true;
      update();
    } else {
      dateController.text =
          DateFormat.yMMMd().format(selectedDate.value).toString();
      var r = dateController.text;
      String d  =  selectedDate.value.toString();
      dattta = DateTime.parse(d).millisecondsSinceEpoch;
      print("pppp");
      print(dattta);
      isDate = true;
      update();
    }
  }


}

