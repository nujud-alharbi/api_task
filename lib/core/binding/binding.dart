import 'package:get/get.dart';

import '../../feature/auth/logic/controller/auth_controller.dart';
import '../../feature/profile/logic/controller/profile_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {

    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => ProfileController());


  }
}