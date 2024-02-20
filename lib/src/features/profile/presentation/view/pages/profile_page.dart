import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpms_ecom/src/core/common/widgets/app_loader.dart';
import 'package:kpms_ecom/src/core/common/widgets/profile_pic_widget.dart';
import 'package:kpms_ecom/src/features/authentication/presentation/controller/auth_controller.dart';
import 'package:kpms_ecom/src/features/profile/presentation/controller/profile_controller.dart';

import '../../../../../core/common/widgets/app_button.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/theme/text_theme.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    super.key,
  });

  final AuthController authController = Get.find<AuthController>();
  final ProfileController profileController = Get.put(ProfileController())
    ..getUserDetails();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                // Add functionality to change profile picture
              },
              child: ProfilePicWidget(profilePicUrl: "", onProfilePicAdded: (file) {}),
            ),
            const SizedBox(height: 24),
            Obx(() {
              if (profileController.profileState.value == ProfileState.loaded) {
                return Column(
                  children: [
                    Text(
                      profileController.userDetails?.email ?? "user@gmail.com",
                      style: AppTextTheme.heading4.copyWith(fontWeight: FontWeight.w300),
                    ),
                    // Add more user details here if needed
                  ],
                );
              } else {
                return const AppLoader();
              }
            }),
            const SizedBox(height: 48),
            ListTile(
              title: const Text("My Orders"),
              leading: const Icon(Icons.done_all),
              onTap: () {
                // Add functionality to navigate to orders page
              },
            ),
            const Divider(color: Colors.grey, indent: 16, endIndent: 16),
            ListTile(
              title: const Text("Change Password"),
              leading: const Icon(Icons.key),
              onTap: () {
                // Add functionality to change password
              },
            ),
            const Divider(color: Colors.grey, indent: 16, endIndent: 16),
            ListTile(
              title: const Text("Preferences"),
              leading: const Icon(Icons.room_preferences),
              onTap: () {
                // Add functionality to manage preferences
              },
            ),
            const SizedBox(height: 28),
            Center(
              child: AppButton(
                buttonText: Strings.logOut,
                onPressed: () {
                  authController.logout();
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
