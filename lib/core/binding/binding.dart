import 'package:get/get.dart';

import '../../feature/auth/logic/controller/auth_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {

    Get.put(AuthController(), permanent: true);



  }
}