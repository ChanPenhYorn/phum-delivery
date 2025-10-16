import 'package:flutter/material.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';

class AppDeviderWidget extends StatelessWidget {
  const AppDeviderWidget({
    super.key,
    this.endIndent,
    this.indent,
    this.height,
    this.color,
  });

  final double? endIndent;
  final double? indent;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: endIndent ?? 50,
      indent: indent ?? 50,
      height: height ?? 1,
      color: color ?? AppColors.lightGray,
    );
  }
}
