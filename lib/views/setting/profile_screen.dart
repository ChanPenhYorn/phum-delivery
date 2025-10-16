import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/controllers/home_controller.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/views/setting/widgets/build_conntent_item_widget.dart';
import 'package:phum_delivery/widgets/app_cache_network_image_widget.dart';
import 'package:phum_delivery/widgets/app_devider_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(bottom: 16),
              color: AppColors.white,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    ClipOval(
                      child: AppCachedNetwordImageWidget(
                          imageUrl:
                              homeController.userModel.value?.profile ?? "",
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
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              buildPersonalInfo(homeController),
              buildAddress(homeController)
            ],
          ))
        ],
      ),
    );
  }

  Container buildAddress(HomeController homeController) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      margin: const EdgeInsets.only(top: 16),
      color: AppColors.lightGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text("Address Info",
                  style: AppFont.semiBold(
                      fontSize: 16, color: AppColors.ligthBaseNew)),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit",
                    style: AppFont.bold(fontSize: 12, color: AppColors.primary),
                  ))
            ],
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BuildContentItemWidget(
                  title: "City/Province",
                  value: homeController.userModel.value?.address.province ?? "",
                  icon: SettingSvg.province,
                ),
                AppDeviderWidget(),
                BuildContentItemWidget(
                  title: "District/Khan",
                  value: homeController.userModel.value?.address.district ?? "",
                  icon: SettingSvg.district,
                ),
                AppDeviderWidget(),
                BuildContentItemWidget(
                  title: "Commune/Khan",
                  value: homeController.userModel.value?.address.commune ?? "",
                  icon: SettingSvg.commune,
                ),
                AppDeviderWidget(),
                BuildContentItemWidget(
                  title: "Village",
                  value: homeController.userModel.value?.address.village ?? "",
                  icon: SettingSvg.village,
                ),
                AppDeviderWidget(),
                BuildContentItemWidget(
                  title: "House No.",
                  value: homeController.userModel.value?.address.house ?? "",
                  icon: SettingSvg.house,
                ),
                AppDeviderWidget(),
                BuildContentItemWidget(
                  title: "Street No",
                  value: homeController.userModel.value?.address.street ?? "",
                  icon: SettingSvg.street,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildPersonalInfo(HomeController homeController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      color: AppColors.lightGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Personal Info",
              style: AppFont.semiBold(
                  fontSize: 16, color: AppColors.ligthBaseNew)),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BuildContentItemWidget(
                  title: "First Name",
                  value: homeController.userModel.value?.firstName ?? "",
                  icon: SettingSvg.settingProfile,
                ),
                AppDeviderWidget(),
                BuildContentItemWidget(
                  title: "Last Name",
                  value: homeController.userModel.value?.lastName ?? "",
                  icon: SettingSvg.settingProfile,
                ),
                AppDeviderWidget(),
                BuildContentItemWidget(
                  title: "Date of Birth",
                  value: homeController.userModel.value?.dateOfBirth ?? "",
                  icon: SettingSvg.date,
                ),
                AppDeviderWidget(),
                BuildContentItemWidget(
                  title: "Email",
                  value: homeController.userModel.value?.email ?? "",
                  icon: SettingSvg.email,
                ),
                AppDeviderWidget(),
                BuildContentItemWidget(
                  title: "Phone",
                  value: homeController.userModel.value?.phone ?? "",
                  icon: SettingSvg.phone,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
