import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:phum_delivery/controllers/home_controller.dart';
import 'package:phum_delivery/controllers/setting_controller.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/routes/app_route.dart';
import 'package:phum_delivery/views/setting/widgets/build_listtile_widget.dart';

import 'package:phum_delivery/widgets/app_cache_network_image_widget.dart';

import '../../core/utils/app_logger.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final settingController = Get.find<SettingController>();

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: const Text("Setting"),
        backgroundColor: AppColors.lightGray,
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 25),
                ClipOval(
                  child: AppCachedNetwordImageWidget(
                      imageUrl: homeController.userModel.value?.profile ?? "",
                      width: 80,
                      height: 80),
                ),
                const SizedBox(height: 16),
                Text(
                    "${homeController.userModel.value?.firstName} ${homeController.userModel.value?.lastName}",
                    style: AppFont.semiBold(fontSize: 16)),
                Text("ID: ${homeController.userModel.value?.id}",
                    style: AppFont.regular(fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: settingController.settingList.length,
                      itemBuilder: (context, index) {
                        final data = settingController.settingList[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BuildListTileWidget(
                                onTap: () {
                                  Logger.log("Click ${data['title']}");
                                  final title = data["title"];
                                  switch (title) {
                                    case "Profile":
                                      Get.toNamed(AppRoutes.personal);
                                      break;
                                    case "Language":
                                      break;
                                    case "Notification":
                                      break;
                                  }
                                },
                                settingController: settingController,
                                leading: SvgPicture.asset(
                                  data["icon"],
                                ),
                                title: data["title"],
                                // subtitle: data["title"],
                                trailing: data["title"] != "Notification"
                                    ? const Icon(Icons.arrow_forward_ios,
                                        size: 16)
                                    : Obx(() => Switch(
                                          value: settingController
                                              .notification.value,
                                          activeTrackColor: Colors.green,
                                          onChanged: (value) {
                                            settingController
                                                .onNotificationToggle();
                                          },
                                        ))),
                            if (index <
                                settingController.settingList.length - 1)
                              Divider(
                                endIndent: 50,
                                indent: 50,
                                height: 1,
                                color: AppColors.lightGray,
                              ),
                          ],
                        );
                      }),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: BuildListTileWidget(
                    onTap: () {},
                    settingController: settingController,
                    leading: SvgPicture.asset(SettingSvg.settingLogout),
                    title: "Logout",
                    // subtitle: data["title"],
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
