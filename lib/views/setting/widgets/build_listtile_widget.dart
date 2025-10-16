import 'package:flutter/material.dart';

import 'package:phum_delivery/controllers/setting_controller.dart';
import 'package:phum_delivery/core/utils/app_font.dart';

class BuildListTileWidget extends StatelessWidget {
  const BuildListTileWidget({
    super.key,
    required this.settingController,
    this.trailing,
    this.onTap,
    this.subtitle,
    this.leading,
    required this.title,
    this.titleStyle,
    this.subtitleStyle,
  });

  final SettingController settingController;

  final Widget? trailing;
  final Function()? onTap;

  final Widget? leading;
  final String title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Text(title, style: titleStyle ?? AppFont.medium(fontSize: 12)),
      subtitle: subtitle != null
          ? Text(subtitle!,
              style: subtitleStyle ?? AppFont.regular(fontSize: 12))
          : null,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
