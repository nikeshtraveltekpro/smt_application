import 'package:flutter/material.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/src/modules/accounts/views/account_view.dart';
import 'package:smt_application/src/modules/home/views/home_view.dart';
import 'package:smt_application/src/modules/sniggy/views/sniggy_view.dart';
import 'package:smt_application/src/modules/trip/views/trip_view.dart';
import 'package:smt_application/src/modules/wishlist/views/wishlist_view.dart';
import 'package:smt_application/utils/app_constants.dart';

enum BodyScreens { home, trip, sniggy, wishlist, account }

extension BodyScreen on BodyScreens {
  int get index {
    switch (this) {
      case BodyScreens.home:
        return 0;
      case BodyScreens.trip:
        return 1;

      case BodyScreens.sniggy:
        return 2;

      case BodyScreens.wishlist:
        return 3;

      case BodyScreens.account:
        return 4;
    }
  }

  String get title {
    switch (this) {
      case BodyScreens.home:
        return AppConstants.home;
      case BodyScreens.trip:
        return AppConstants.myTrips;

      case BodyScreens.sniggy:
        return AppConstants.sniggy;

      case BodyScreens.wishlist:
        return AppConstants.wishlist;

      case BodyScreens.account:
        return AppConstants.account;
    }
  }

  String get icon {
    switch (this) {
      case BodyScreens.home:
        return Assets.home;
      case BodyScreens.trip:
        return Assets.trip;

      case BodyScreens.sniggy:
        return Assets.sniggy;

      case BodyScreens.wishlist:
        return Assets.heart;

      case BodyScreens.account:
        return Assets.account;
    }
  }

  String get selectedIcon {
    switch (this) {
      case BodyScreens.home:
        return Assets.homeSelected;
      case BodyScreens.trip:
        return Assets.selectedTrip;

      case BodyScreens.sniggy:
        return Assets.selectedTrip;

      case BodyScreens.wishlist:
        return Assets.selectedWishlist;

      case BodyScreens.account:
        return Assets.selectedAccount;
    }
  }

  Widget get screens {
    switch (this) {
      case BodyScreens.home:
        return const HomeView();
      case BodyScreens.trip:
        return const TripView();

      case BodyScreens.sniggy:
        return const SniggyView();

      case BodyScreens.wishlist:
        return const WishlistView();

      case BodyScreens.account:
        return const AccountView();
    }
  }
}
