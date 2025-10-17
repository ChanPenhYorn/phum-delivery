import 'package:flutter/material.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
    this.isExpanded = false,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.icon,
    this.padding,
    this.style,
    this.textStyle,
  });

  final String label;
  final void Function()? onPressed;
  final bool isExpanded;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final IconData? icon;
  final EdgeInsets? padding;

  final ButtonStyle? style;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded ? double.infinity : null,
      child: ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? AppColors.primary,
              padding: padding ?? const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                side: BorderSide(
                  color: backgroundColor ?? AppColors.primary,
                ),
              ),
            ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null)
              Row(
                children: [
                  Icon(
                    icon,
                    color: textColor ?? Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
            Text(label,
                style: textStyle ??
                    AppFont.semiBold(
                        fontSize: 16, color: textColor ?? Colors.white)),
          ],
        ),
      ),
    );
  }
}
