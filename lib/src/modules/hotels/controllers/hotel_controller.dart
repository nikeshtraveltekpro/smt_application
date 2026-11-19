import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smt_application/routes/app_pages.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';
import 'package:smt_application/src/modules/hotels/models/hotel_recent_search_model.dart';
import 'package:smt_application/src/modules/hotels/models/price_model.dart';
import 'package:smt_application/src/modules/hotels/models/room_model.dart';
import 'package:smt_application/src/modules/hotels/models/select_dates_model.dart';
import 'package:smt_application/src/modules/hotels/views/room_guest_bottomsheet.dart';
import 'package:smt_application/src/modules/hotels/views/room_price_bottomsheet.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_constants.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_constants.dart';

class HotelController extends GetxController {
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
  final Rx<SelectDatesModel> selectedDates = const SelectDatesModel().obs;
  final today = DateTime.now().obs;

  RxString country = HotelConstants.hotelSearchCountryName.obs;

  String get dateIn {
    final checkIn = selectedDates.value.checkInDate;

    return DateFormat('dd MMM, yyyy').format(checkIn ?? today.value);
  }

  String get dateOut {
    final checkOut = selectedDates.value.checkOutDate;

    return DateFormat('dd MMM, yyyy')
        .format(checkOut ?? today.value.add(const Duration(days: 1)));
  }

  void addRecentSearch() {
    final checkIn = selectedDates.value.checkInDate ?? dateOnly(today.value);

    final checkOut =
        selectedDates.value.checkOutDate ??
        dateOnly(today.value.add(const Duration(days: 1)));

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

  Future<void> openCalendar({required bool isCheckIn}) async {
    final calendarController = Get.find<CalendarController>();

    calendarController.prepareCalendar(
      initialDates: selectedDates.value,
      isCheckIn: isCheckIn,
    );

    final result = await Get.toNamed(Routes.calendar);

    if (result is SelectDatesModel) {
      selectedDates.value = result;
    }
  }

  DateTime dateOnly(DateTime date) => DateTime(date.year, date.month, date.day);

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
    }
    updateGuestCounts();
  }

  void selectPrice(value) {
    if (value != null) {
      selectedPrice.value = value;
    }
  }

  void confirmRoomAndGuests() {
    updateGuestCounts();
    roomList.refresh();
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    priceList.assignAll(
      priceRanges.map((range) => PriceModel(price: range)).toList(),
    );
  }

  void decreaseChildren(index) {
    if (roomList[index].children.value > 1) {
      roomList[index].children.value--;
    }
    updateGuestCounts();
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

  void addRoom() {
    roomList.add(RoomModel());
    if (roomList.length == 2) {
      height.value = Get.height * 0.60;
    }
    if (roomList.length > 2) {
      height.value = Get.height * 0.75;
    }
  }

  void removeRoom(int index) {
    if (index != 0) {
      roomList.removeAt(index);
      if (roomList.length == 2) {
        height.value = Get.height * 0.60;
      }
      if (roomList.length < 2) {
        height.value = Get.height * 0.40;
      }
    }
  }

  void getRoomBottomSheet() {
    print("Bottom Sheet Tapped=====================");
    Get.bottomSheet(
      RoomGuestBottomsheet(),
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
    );
  }

  void getPriceBottomSheet() {
    print("Bottom Sheet Tapped=====================");
    Get.bottomSheet(
      RoomPriceBottomsheet(),
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
    );
  }
}
