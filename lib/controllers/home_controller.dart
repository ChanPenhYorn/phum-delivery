import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/domain/entities/user_entity.dart';
import 'package:phum_delivery/domain/usecases/home_usecase.dart';

class HomeController extends GetxController {
  final HomeUseCase useCase;

  HomeController(this.useCase);

  @override
  void onInit() {
    super.onInit();
    userProfile("");
    deliveryItems("");
  }

  var isLoadingProfile = false.obs;
  var isLoadingDeliveryItems = false.obs;
  Rx<UserEntity?> userModel = Rx<UserEntity?>(null);
  Rx<List<DeliveryItemEntity>> deliveryItemsList =
      Rx<List<DeliveryItemEntity>>([]);

  Future<void> userProfile(String token) async {
    isLoadingProfile.value = true;
    await Future.delayed(const Duration(seconds: 3));
    isLoadingProfile.value = false;
    userModel.value = await useCase.userProfile(token);
  }

  //! delivery group by date
  final RxMap<DateTime, List<DeliveryItemEntity>> groupedDeliveries =
      <DateTime, List<DeliveryItemEntity>>{}.obs;

  Future<void> deliveryItems(String token) async {
    isLoadingDeliveryItems.value = true;
    await Future.delayed(const Duration(seconds: 3));
    isLoadingDeliveryItems.value = false;
    deliveryItemsList.value.assignAll(await useCase.deliveryItems(token));
    groupDeliveriesByDate();
  }

  void groupDeliveriesByDate() {
    final grouped = groupBy(
      deliveryItemsList.value,
      (item) {
        final date = DateTime.parse(item.createdAt);
        return DateTime(date.year, date.month, date.day);
      },
    );
    groupedDeliveries.assignAll(grouped);
  }

  /// Example: add new data dynamically
  // void addNewItem(DeliveryItemEntity item) {
  //   deliveryItemsList.value.add(item);
  //   groupDeliveriesByDate(); // regroup automatically
  // }
}
