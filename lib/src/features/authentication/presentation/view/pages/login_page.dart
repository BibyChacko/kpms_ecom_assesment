import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/text_theme.dart';
import '../widgets/login_form_widget.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: AppTheme.primaryColor,
                height: 240, // Adjust the height as needed
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const LoginFormWidget(),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => _navigateToSignUp(context),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: Strings.newUserText,
                              style: AppTextTheme.bodyStyle,
                            ),
                            const TextSpan(text: "  "),
                            TextSpan(
                              text: Strings.signUp,
                              style: AppTextTheme.bodyStyle.copyWith(
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToSignUp(BuildContext context) {
    Get.to(const SignUpPage());
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
