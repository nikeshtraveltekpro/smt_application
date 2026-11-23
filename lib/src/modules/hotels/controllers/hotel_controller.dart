import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';
import 'package:smt_application/src/modules/hotels/models/hotel_recent_search_model.dart';
import 'package:smt_application/src/modules/hotels/models/popular_destination_model.dart';
import 'package:smt_application/src/modules/hotels/models/price_model.dart';
import 'package:smt_application/src/modules/hotels/models/room_model.dart';
import 'package:smt_application/src/modules/hotels/repo/hotel_repositories.dart';
import 'package:smt_application/src/modules/hotels/views/room_guest_bottomsheet.dart';
import 'package:smt_application/src/modules/hotels/views/room_price_bottomsheet.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_constants.dart';
import 'package:smt_application/utils/app_colors.dart';

class HotelController extends GetxController {
  HotelController({required this.hotelRepositories});
  final HotelRepositories hotelRepositories;
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  RxString errorMsg = ''.obs;
  RxInt length = 1.obs;
  RxInt adultCount = 1.obs;
  RxInt children = 0.obs;
  RxList<RoomModel> roomList = <RoomModel>[RoomModel()].obs;
  final List<String> priceRanges = [
    '₹0-₹1500',
    '₹1500-₹2500',
    '₹2500-₹5000',
    '₹5000+',
  ];
  RxDouble height = (Get.height * 0.40).obs;
  RxList<PriceModel> priceList = <PriceModel>[].obs;
  RxString selectedPrice = '0'.obs;
  String get selectedRoom => "${roomList.length} Room";
  RxString selectedCity = HotelConstants.hotelSearchCityName.obs;
  RxString totalAdults = HotelConstants.room1AdultsTotal.obs;
  RxString totalChildren = HotelConstants.room1Children1Total.obs;
  String get selectedTotalPerson =>
      "${int.parse(totalAdults.value) + int.parse(totalChildren.value)} Guest";
  RxBool is4Star = false.obs;
  RxBool isFullRefundable = false.obs;
  RxList<HotelRecentSearchModel> recentSearch = <HotelRecentSearchModel>[].obs;

  RxList<PopularDestinationModel> popularList = <PopularDestinationModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchPopularDestination();
    priceList.assignAll(
      priceRanges.map((range) => PriceModel(price: range)).toList(),
    );
  }

  Future<void> fetchPopularDestination() async {
    isLoading(true);
    hasError(false);
    errorMsg('');
    try {
      final content = await hotelRepositories.fetchPopularDestination();
      popularList.assignAll(content);
    } on HotelRepositoriesException catch (e) {
      hasError(true);
      errorMsg(e.toString());
    } catch (e) {
      hasError(true);
      errorMsg(e.toString());
    } finally {
      isLoading(false);
    }
  }

  RxString country = 'India'.obs;
  void toggle4Star() {
    is4Star.value = !is4Star.value;
  }

  void toggleFullRefundable() {
    isFullRefundable.value = !isFullRefundable.value;
  }

  void updateGuestCounts() {
    int adultsSum = 0;
    int childrenSum = 0;

    for (var room in roomList) {
      adultsSum += room.adults.value;
      childrenSum += room.children.value;
    }

    totalAdults.value = adultsSum.toString();
    totalChildren.value = childrenSum.toString();
  }

  void increaseChildren(int index) {
    if (roomList[index].children.value < 7) {
      roomList[index].children.value++;
      final childAges = roomList[index].childAges;
      if (childAges.length < roomList[index].children.value) {
        childAges.add('Under 1');
      }
    }
    updateBottomSheetHeight();
    updateGuestCounts();
  }

  void selectPrice(String value) {
    if (value.isNotEmpty) {
      selectedPrice.value = value;
    }
  }

  void confirmRoomAndGuests() {
    updateGuestCounts();
    roomList.refresh();
    Get.back();
  }

  void decreaseChildren(int index) {
    if (roomList[index].children.value > 0) {
      roomList[index].children.value--;
      if (roomList[index].childAges.isNotEmpty) {
        roomList[index].childAges.removeLast();
      }
    }
    updateBottomSheetHeight();
    updateGuestCounts();
  }

  void updateChildAge(int roomIndex, int childIndex, String age) {
    final childAges = roomList[roomIndex].childAges;
    if (childIndex < childAges.length) {
      childAges[childIndex] = age;
      childAges.refresh();
    }
  }

  void increaseAdult(int index) {
    if (roomList[index].adults.value < 7) {
      roomList[index].adults.value++;
    }
    updateGuestCounts();
  }

  void decreaseAdult(int index) {
    if (roomList[index].adults.value > 1) {
      roomList[index].adults.value--;
    }
    updateGuestCounts();
  }

  void addRecentSearch() {
    final calendarController = Get.find<CalendarController>();

    final checkIn =
        calendarController.selectedDates.value.checkInDate ??
        calendarController.dateOnly(DateTime.now());

    final checkOut =
        calendarController.selectedDates.value.checkOutDate ??
        calendarController.dateOnly(
          DateTime.now().add(const Duration(days: 1)),
        );

    final recentCheckIn = DateFormat('dd MMM').format(checkIn);
    final fullCheckInDay = DateFormat('EEEE').format(checkIn);

    final recentCheckOut = DateFormat('dd MMM').format(checkOut);
    final fullCheckOutDay = DateFormat('EEEE').format(checkOut);

    recentSearch.removeWhere((item) {
      return item.city == selectedCity.value &&
          item.guests == selectedTotalPerson &&
          item.rooms == selectedRoom &&
          item.dateIn == DateFormat('dd MMM, yyyy').format(checkIn) &&
          item.dateOut == DateFormat('dd MMM, yyyy').format(checkOut);
    });

    recentSearch.insert(
      0,
      HotelRecentSearchModel(
        country: country.value,
        dateIn: DateFormat('dd MMM, yyyy').format(checkIn),
        dateOut: DateFormat('dd MMM, yyyy').format(checkOut),
        fullCheckIn: recentCheckIn,
        fullCheckInDay: fullCheckInDay,
        fullCheckOut: recentCheckOut,
        fullCheckOutDay: fullCheckOutDay,
        city: selectedCity.value,
        rooms: selectedRoom,
        guests: selectedTotalPerson,
      ),
    );
  }

  void addRoom() {
    roomList.add(RoomModel());
    updateBottomSheetHeight();
  }

  void removeRoom(int index) {
    if (index != 0) {
      roomList.removeAt(index);
      updateBottomSheetHeight();
    }
  }

  void updateBottomSheetHeight() {
    double bottomSheetHeight;
    if (roomList.length >= 3) {
      bottomSheetHeight = 0.75;
    } else if (roomList.length == 2) {
      bottomSheetHeight = 0.60;
    } else {
      bottomSheetHeight = 0.40;
    }

    int ageRows = 0;
    for (final room in roomList) {
      ageRows += (room.children.value / 3).ceil();
    }
    bottomSheetHeight += ageRows * 0.09;
    if (bottomSheetHeight > 0.88) {
      bottomSheetHeight = 0.88;
    }
    height.value = Get.height * bottomSheetHeight;
  }

  void getRoomBottomSheet() {
    Get.bottomSheet(
      const RoomGuestBottomsheet(),
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
    );
  }

  void getPriceBottomSheet() {
    Get.bottomSheet(
      const RoomPriceBottomsheet(),
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
    );
  }
}
