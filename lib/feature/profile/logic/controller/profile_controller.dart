import 'package:api_todo_auth/feature/profile/logic/service/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/constant/api_string.dart';
import '../../../../core/constant/keys.dart';
import '../../../auth/model/user.dart';

class ProfileController extends GetxController {
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

  getData() async {
    var url = "https://64609b83ca2d89f7e75b487e.mockapi.io/user?id=2";
    var data = await profileiService.getData(
      url: ApiString.baseUrl,
      headers: headers,
    );
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

  var difference;
  String formateDate() {
    var brithDateStorage = GetStorage().read(AppKeys.brithDateKey);
    var timeStamp = int.parse(brithDateStorage);

    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp);

    var birthday = DateTime.fromMillisecondsSinceEpoch(timeStamp) as DateTime;
    print(birthday);
    final dateNow = DateTime.now();
    print(dateNow);

    difference = daysBetween(birthday, dateNow);
    return difference;
  }

  String daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);

    int totalDays = to.difference(from).inDays;
    int years = totalDays ~/ 365;
    int months = (totalDays - years * 365) ~/ 30;
    int days = totalDays - years * 365 - months * 30;

    return ("$years ${"years"} $months  ${"months"} $days  ${"days"} ");
  }
}
