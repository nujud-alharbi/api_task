
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/theme/app_colors.dart';
import '../logic/controller/profile_controller.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    // return GetBuilder<ProfileController>(builder: (profileController) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            // profileController.isLoading
            //     ?
          // Container(
          //           height: 100,
          //           width: 100,
          //           decoration: BoxDecoration(
          //             color: lightColor,
          //             shape: BoxShape.circle,
          //             image: DecorationImage(
          //               image: AssetImage(AppImages.lodingImage),
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //         )
          //       :
          Stack(children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: lightColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:
                          // profileController.profilePhoto == null
                          //     ?
                            AssetImage(AppImages.profileImage)
                                  as ImageProvider ,
                              // : AssetImage(AppImages.profileImage)

                          // NetworkImage(
                                  // profileController.profilePhoto!,
                             // ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 70,
                        left: 60,
                        child: InkWell(
                          onTap: () async {
                            // await profileController.pickImage();
                            // await profileController.updateUserPhoto();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: blackColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.flip_camera_ios_outlined,
                              color: whiteColor,
                              size: 18,
                            ),
                          ),
                        ))
                  ]),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: 30,
            ),
            Text("lll"
              // profileController.nameController.text,
              // style: theme.headlineLarge,
            ),
            Text("llll"
              // profileController.emailController.text,
              // style: theme.headlineSmall,
            ),
          ],
        ),
      );
    // });
  }
}
