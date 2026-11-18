import 'package:get/get.dart';
import 'package:smt_application/src/modules/accounts/bindings/account_binding.dart';
import 'package:smt_application/src/modules/accounts/views/account_view.dart';
import 'package:smt_application/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:smt_application/src/modules/dashboard/views/dashboard_view.dart';
import 'package:smt_application/src/modules/home/bindings/home_binding.dart';
import 'package:smt_application/src/modules/home/views/home_view.dart';
import 'package:smt_application/src/modules/hotels/bindings/hotels_binding.dart';
import 'package:smt_application/src/modules/hotels/views/hotel_view.dart';
import 'package:smt_application/src/modules/sniggy/bindings/sniggy_binding.dart';
import 'package:smt_application/src/modules/sniggy/views/sniggy_view.dart';
import 'package:smt_application/src/modules/trip/bindings/trip_binding.dart';
import 'package:smt_application/src/modules/trip/views/trip_view.dart';
import 'package:smt_application/src/modules/wishlist/bindings/wishlist_binding.dart';
import 'package:smt_application/src/modules/wishlist/views/wishlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.trip,
      page: () => const TripView(),
      binding: TripBinding(),
    ),GetPage(
      name: _Paths.sniggy,
      page: () => const SniggyView(),
      binding: SniggyBinding(),
    ),
    GetPage(
      name: _Paths.wishlist,
      page: () => const WishlistView(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: _Paths.account,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ), GetPage(
      name: _Paths.hotel,
      page: () => const HotelView(),
      binding: HotelBinding(),
    ),
  ];
}
