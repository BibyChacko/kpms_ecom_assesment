import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_dimensions.dart';
import '../../theme/app_theme.dart';
import '../../theme/text_theme.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.label,
    required this.textEditingController,
    this.hint,
    this.isObscure = false,
    this.suffix,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
    this.formatter,
  });

  final String label;
  final String? hint;
  final TextEditingController textEditingController;
  final bool isObscure;
  final bool readOnly;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? formatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textEditingController,
        validator: validator,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: keyboardType,
        inputFormatters: formatter,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: AppTextTheme.bodyLightStyle,
            suffix: suffix,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            hintStyle: AppTextTheme.bodyLightStyle
                .copyWith(color: AppTheme.textColorSecondary, fontSize: 14),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppTheme.textColorPrimary),
                borderRadius: BorderRadius.circular(appBorderRadius)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppTheme.textColorPrimary),
                borderRadius: BorderRadius.circular(appBorderRadius)),
            hintText: hint,
            hintMaxLines: 2,
            floatingLabelBehavior: FloatingLabelBehavior.never),
        obscureText: isObscure);
  }
}
