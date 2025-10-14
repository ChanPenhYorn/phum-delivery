import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phum_delivery/controllers/home_controller.dart';
import 'package:phum_delivery/controllers/theme_controller.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/widgets/app_button_widget.dart';
import 'package:phum_delivery/widgets/app_cache_network_image_widget.dart';
import 'package:phum_delivery/widgets/app_textformfield_widget.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/widgets/shimmer/home/delivery_item_shimmer.dart';
import 'package:phum_delivery/widgets/shimmer/user_profile_shimmer.dart';

class HomeScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async {
          homeController.userProfile("");
          homeController.deliveryItems("");
        },
        child: CustomScrollView(
          slivers: [
            // --- AppBar ---
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.lightGray,
              actions: [
                SvgPicture.asset("assets/svg/cambodia.svg",
                    width: 24, height: 24),
                const SizedBox(width: 16),
                SvgPicture.asset("assets/svg/moon.svg", width: 24, height: 24),
                const SizedBox(width: 16),
              ],
              title: Row(
                children: [
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
                        imageUrl: homeController.userModel.value?.profile ?? "",
                      );
                    })),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Morning", style: AppFont.regular(fontSize: 14)),
                      Text("Henry", style: AppFont.semiBold(fontSize: 14)),
                    ],
                  ),
                ],
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
                    Text("Delivery PickUp",
                        style: AppFont.semiBold(fontSize: 24)),
                    AppButtonWidget(
                      backgroundColor: AppColors.basePrimary,
                      label: "History",
                      onPressed: () {},
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
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  AppTextformfieldWidget(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                    controller: searchController,
                    borderRadius: BorderRadius.circular(30),
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
                                  ...dateItems
                                      .map((item) => buildDeliveryItem(item)),
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
  Widget buildDeliveryItem(DeliveryItemEntity item) {
    return ListTile(
      leading: SvgPicture.asset(item.image, width: 40, height: 40),
      title: Text(item.name, style: AppFont.semiBold(fontSize: 16)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${item.total} items",
              style:
                  AppFont.regular(fontSize: 14, color: AppColors.ligthBaseNew)),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Go to pickup at ",
                  style: AppFont.regular(
                      fontSize: 14, color: AppColors.ligthBaseNew),
                ),
                TextSpan(
                  text: "WS-TTP",
                  style:
                      AppFont.semiBold(fontSize: 14, color: AppColors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (item.status == "new")
            Container(
              margin: const EdgeInsets.only(right: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.lightBaseSecondary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "New",
                style: AppFont.semiBold(
                    fontSize: 12, color: AppColors.baseSecondary),
              ),
            ),
          SvgPicture.asset(AssetSvg.arrowTop, width: 20, height: 20),
        ],
      ),
    );
  }
}
