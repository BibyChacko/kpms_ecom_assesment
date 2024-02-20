import 'package:flutter/material.dart';

import '../../theme/text_theme.dart';
import 'app_button.dart';
class LoadErrorWidget extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback onRetryPressed;
  const LoadErrorWidget(
      {super.key,
      required this.title,
      required this.body,
      required this.onRetryPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextTheme.heading4,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          body,
          style: AppTextTheme.bodyLightStyle,
        ),
        const SizedBox(
          height: 12,
        ),
        AppButton(buttonText: "Retry", onPressed: onRetryPressed)
      ],
    );
  }
}
