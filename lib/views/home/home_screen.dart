import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phum_delivery/controllers/home_controller.dart';
import 'package:phum_delivery/controllers/setting_controller.dart';
import 'package:phum_delivery/controllers/theme_controller.dart';
import 'package:phum_delivery/core/constants/app_string.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/routes/app_route.dart';
import 'package:phum_delivery/views/home/widgets/delivery_item_widget.dart';
import 'package:phum_delivery/views/setting/widgets/language_select_widget.dart';
import 'package:phum_delivery/widgets/app_action_widget.dart';
import 'package:phum_delivery/widgets/app_button_widget.dart';
import 'package:phum_delivery/widgets/app_cache_network_image_widget.dart';
import 'package:phum_delivery/widgets/app_textformfield_widget.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/views/home/widgets/shimmer/delivery_item_shimmer.dart';
import 'package:phum_delivery/widgets/shimmer/shimmer_item_widget.dart';
import 'package:phum_delivery/widgets/shimmer/user_profile_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final homeController = Get.find<HomeController>();
    final settingController = Get.find<SettingController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGray,
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async {
          homeController.userProfile("");
          homeController.deliveryItems("");
        },
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            // --- AppBar ---
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.lightGray,
              actions: [
                GestureDetector(
                  onTap: () {
                    languageSelectButtonSheet(context, settingController);
                  },
                  child: Obx(() => Image.asset(
                      settingController.language.value == "km"
                          ? AssetSvg.kmImage
                          : AssetSvg.enImage,
                      width: 24,
                      height: 24)),
                ),
                const SizedBox(width: 16),
                SvgPicture.asset(AssetSvg.moon, width: 24, height: 24),
                const SizedBox(width: 16),
              ],
              title: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.setting);
                },
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: ClipOval(child: Obx(() {
                        if (homeController.isLoadingProfile.value) {
                          return UserProfileShimmer();
                        }
                        return AppCachedNetwordImageWidget(
                          width: 40,
                          height: 40,
                          imageUrl:
                              homeController.userModel.value?.profile ?? "",
                        );
                      })),
                    ),
                    const SizedBox(width: 10),
                    Obx(() {
                      if (homeController.isLoadingProfile.value) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerItemWidget(
                                width: 100,
                              ),
                              SizedBox(height: 8),
                              ShimmerItemWidget(
                                width: 100,
                              )
                            ],
                          ),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(homeController.greeting.value.tr,
                              style: AppFont.regular(fontSize: 14)),
                          Text(
                              "${homeController.userModel.value?.firstName} ${homeController.userModel.value?.lastName.tr}",
                              style: AppFont.semiBold(fontSize: 14)),
                        ],
                      );
                    })
                  ],
                ),
              ),
              pinned: true,
            ),

            // --- Title Section ---
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.deliveryPickup.tr,
                        style: AppFont.semiBold(fontSize: 24)),
                    AppButtonWidget(
                      backgroundColor: AppColors.basePrimary,
                      label: AppString.history.tr,
                      onPressed: () {
                        Get.toNamed(AppRoutes.history);
                      },
                      textColor: AppColors.primary,
                      icon: Icons.history,
                      borderRadius: 30,
                      isExpanded: false,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ],
                ),
              ),
            ),

            // --- Main List Section ---
            SliverFillRemaining(
                // hasScrollBody: true,
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.searchPickup);
                    },
                    child: AppTextformfieldWidget(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      controller: searchController,
                      isRequried: false,
                      isEnable: false,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Obx(() {
                      if (homeController.isLoadingDeliveryItems.value) {
                        return ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const DeliveryItemShimmer();
                          },
                        );
                      }

                      if (homeController.deliveryItemsList.value.isEmpty) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 16),
                            AppActionWidget.noData(
                                title: "There are currently no delivered tasks",
                                message:
                                    "Please check back later or assign a new task to get started.",
                                icon: AssetSvg.motoDelivery),
                            const SizedBox(height: 16),
                          ],
                        );
                      }
                      final grouped = homeController.groupedDeliveries;

                      // Sort dates (newest first)
                      final sortedDates = grouped.keys.toList()
                        ..sort((a, b) => b.compareTo(a));

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            // ✅ Grouped List Display
                            ...sortedDates.map((date) {
                              final isToday =
                                  DateUtils.isSameDay(date, DateTime.now());
                              final formattedDate = isToday
                                  ? "Today"
                                  : DateFormat('dd MMMM yyyy').format(date);

                              final dateItems = grouped[date]!;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formattedDate,
                                    style: AppFont.semiBold(
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ...dateItems.map((item) => buildDeliveryItem(
                                        item,
                                        onTap: () {
                                          Get.toNamed(
                                              AppRoutes.pickupProcessing,
                                              arguments: {
                                                'deliveryName': item.name,
                                              });
                                        },
                                      )),
                                  // const Divider(height: 24),
                                ],
                              );
                            }),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  // ✅ Build each delivery item
  Widget buildDeliveryItem(DeliveryItemEntity item,
      {required Function() onTap}) {
    return DeliveryItemWidget(item: item, onTap: onTap);
  }
}
