import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/core/constants/app_string.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_reqex.dart';
import 'package:phum_delivery/core/utils/app_textformfiled_formatter.dart';
import 'package:phum_delivery/core/utils/enum/app_textformfield_enum.dart';

class AppTextformfieldWidget extends StatelessWidget {
  const AppTextformfieldWidget(
      {super.key,
      required this.controller,
      this.onChanged,
      this.hintText,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType,
      this.prefixIcon,
      this.textAlign = TextAlign.start,
      this.prefixOnTap,
      this.suffixOnTap,
      this.type,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.isRequried = true,
      this.isEnable = true,
      this.maxLines,
      this.minLines,
      this.textStyle,
      this.contentPadding,
      this.focusNode,
      this.fillColor,
      this.maxLength,
      this.borderRadius,
      this.autofocus});
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final TextAlign textAlign;
  final void Function()? prefixOnTap;
  final void Function()? suffixOnTap;
  final AppTextformfieldEnum? type;
  final AutovalidateMode? autovalidateMode;
  final bool? isRequried;
  final bool isEnable;
  final int? maxLines;
  final int? minLines;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final Color? fillColor;
  final int? maxLength;
  final BorderRadius? borderRadius;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? inputFormatters =
        _getInputFormatters(type, controller);

    return TextFormField(
      autofocus: autofocus ?? false,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      focusNode: focusNode,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      enabled: isEnable,
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode,
      textAlign: textAlign,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      controller: controller,
      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        counterText: '', // Remove counter text
        errorStyle: const TextStyle(
          color: Colors.red, // Customize error text color
          fontSize: 14, // Customize error text size
        ),
        counterStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.primary, fontWeight: FontWeight.w500),
        fillColor: fillColor ?? AppColors.lightGray,
        filled: true,
        focusColor: AppColors.secondary,
        hoverColor: AppColors.secondary,
        prefixIconColor: Colors.grey,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        hintText: hintText ?? 'hint',
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius ?? BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius ?? BorderRadius.circular(10)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius ?? BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius ?? BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius ?? BorderRadius.circular(10)),
        suffixIcon: type == AppTextformfieldEnum.password
            ? GestureDetector(
                onTap: suffixOnTap,
                child: Icon(
                  obscureText == true
                      ? Icons.visibility_off
                      : Icons.remove_red_eye,
                  color: Colors.grey[800],
                ),
              )
            : suffixIcon == null
                ? null
                : GestureDetector(onTap: suffixOnTap, child: suffixIcon),
        prefixIcon: prefixIcon == null
            ? null
            : GestureDetector(onTap: prefixOnTap, child: prefixIcon),
      ),
      onChanged: onChanged,
      validator: validationMethod,
    );
  }

  List<TextInputFormatter>? _getInputFormatters(
      AppTextformfieldEnum? type, TextEditingController? controller) {
    switch (type) {
      case AppTextformfieldEnum.phone:
        return [AppTextformfiledFormatter.phoneInputFormatter()];
      case AppTextformfieldEnum.name:
        return [AppTextformfiledFormatter.toUpperCaseFormatter()];
      case AppTextformfieldEnum.password:
      default:
        return []; // Default case, no special formatting
    }
  }

  String? validationMethod(String? value) {
    if (value == null || value.isEmpty && isRequried == true) {
      return AppString.fieldRequired.tr;
    }

    switch (type) {
      case AppTextformfieldEnum.email:
        if (!AppReqex().emailRegex.hasMatch(value)) {
          return AppString.invalidEmailFormat.tr;
        }
        break;
      case AppTextformfieldEnum.name:
        if (!AppReqex().englishNameRegexp.hasMatch(value)) {
          return AppString.nameShouldContainEnglishCharactersOnly.tr;
        }
        break;
      case AppTextformfieldEnum
            .password: // Corrected the typo from 'passwoord' to 'password'
        if (!AppReqex().passwordRegexp.hasMatch(value)) {
          // return 'message.password_at_least'.tr; // Improved message
          return AppString.passwordMustBeAtLeast6CharactersLong.tr;
        }
        break;
      case AppTextformfieldEnum.phone:
        if (!AppReqex().khmerPhoneRegexp.hasMatch(value)) {
          return AppString.invalidPhoneNumberFormat.tr;
        }
      default:
        break; // Default case, no validation
    }

    return null; // Return null if validation passes
  }
}
