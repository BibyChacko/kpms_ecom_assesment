import 'package:flutter/material.dart';

import '../../constants/app_dimensions.dart';
import '../../theme/app_theme.dart';
import '../../theme/text_theme.dart';
class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
        required this.buttonText,
        required this.onPressed,
        this.width = 220,
        this.height = 40,
        this.isDisabled = false,
        this.backgroundColor,
        this.foregroundColor});

  final String buttonText;
  final Function onPressed;
  final bool isDisabled;
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppTheme.primaryColor,
            foregroundColor: foregroundColor ?? Colors.white,
            minimumSize: Size(width, height),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(appBorderRadius)),
            textStyle: AppTextTheme.bodyStyle.copyWith(color: Colors.white)),
        onPressed: () {
          isDisabled ? null : onPressed();
        },
        child: Text(buttonText));
  }
}