import 'package:flutter/material.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
    this.isExpanded = false,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  final String label;
  final void Function()? onPressed;
  final bool isExpanded;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            side: BorderSide(
              color: backgroundColor ?? AppColors.primary,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: textColor ?? Colors.white)),
      ),
    );
  }
}
