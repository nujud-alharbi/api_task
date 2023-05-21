

import 'package:get/get.dart';

import '../../feature/auth/view/screen/SignUp.dart';
import '../../feature/profile/view/screen/profileScreen.dart';
import '../binding/binding.dart';

class AppRoutes {
  static final routes = [


    GetPage(
        name: Routes.signScreen,
        page: () => SignUpScreen(),
        binding: Binding()),
    GetPage(
        name: Routes.profileScreen,
        page: () => const ProfileScreen(),
        binding: Binding()),

  ];
}

class Routes {

  static const signScreen = '/signup_screen';

  static const profileScreen = '/profile_screen';

}
