import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/routes/app_pages.dart';
import 'package:smt_application/src/modules/home/models/home_category_model.dart';
import 'package:smt_application/src/modules/home/models/home_content_model.dart';
import 'package:smt_application/src/modules/home/models/home_dynamic_banner_model.dart';
import 'package:smt_application/src/modules/home/models/home_hotel_deal_model.dart';
import 'package:smt_application/src/modules/home/models/home_offer_model.dart';
import 'package:smt_application/src/modules/home/models/home_subcategory_model.dart';
import 'package:smt_application/src/modules/home/models/home_top_flights_model.dart';
import 'package:smt_application/utils/app_constants.dart';

class HomeRepositoryException implements Exception {
  final String msg;

  HomeRepositoryException({required this.msg});

  @override
  String toString() => msg;
}

class HomeRepository {
  Future<HomeContentModel> fetchHomeContent() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      return await buildHomeContent();
    } catch (e) {
      throw HomeRepositoryException(msg: e.toString());
    }
  }

  Future<List<HomeHotelDealModel>> fetchHotelDeal() async {
    try {
      final data = await rootBundle.loadString(Assets.homeHotelDeals);
      final decodedData = jsonDecode(data);

      if (decodedData is! List) {
        throw 'Response is not List';
      }
      final List<HomeHotelDealModel> response = decodedData
          .map((item) => HomeHotelDealModel.fromJson(item))
          .toList();

      return response;
    } on HomeRepositoryException {
      rethrow;
    } catch (e) {
      throw HomeRepositoryException(
        msg: "Exception Occur In Hotel Deals : ${e.toString()}",
      );
    }
  }

  Future<List<HomeTopFlightsModel>> fetchTopFlights() async {
    try {
      final data = await rootBundle.loadString(Assets.homeTopFlights);
      final decodedData = jsonDecode(data);

      if (decodedData is! List) {
        throw 'Response is not List';
      }
      final List<HomeTopFlightsModel> response = decodedData
          .map((item) => HomeTopFlightsModel.fromJson(item))
          .toList();

      return response;
    } on HomeRepositoryException {
      rethrow;
    } catch (e) {
      throw HomeRepositoryException(
        msg: "Exception Occur In Top Flights: ${e.toString()}",
      );
    }
  }

  Future<HomeContentModel> buildHomeContent() async {
    return HomeContentModel(
      categories: buildCategories(),
      subcategories: buildSubcategories(),
      offers: buildOffers(),
      hotelDeals: await fetchHotelDeal(),
      topFlights: await fetchTopFlights(),
      dynamicBanners: buildDynamicBanner(),
    );
  }
}

// List<HomeTopFlightsModel> buildTopFlights() {
//   return [
//     HomeTopFlightsModel(
//       id: 1,
//       title: 'Dubai',
//       image: 'https://res.cloudinary.com/dtljonz0f/image/upload/c_auto,ar_4:3,w_1200,g_auto/f_auto/q_auto/v1/shutterstock_2414539851_ss_non-editorial_dcx0bm?_a=BAVHyiGg0',
//       subtitle: 'From Thiruvananthapuram',
//     ),
//     HomeTopFlightsModel(
//       id: 2,
//       title: 'Toronto',
//       image: 'https://cdn.getyourguide.com/image/format=avif%2Cfit=cover%2Cgravity=auto%2Cquality=60%2Cwidth=1600%2Cheight=900/dam/BCC-2024-EXPLORER-TORONTO-FUN-THINGS-TO-DO-IN-TORONTO-HEADER_DESKTOP.jpg',
//       subtitle: 'From New Delhi',
//     ),
//     HomeTopFlightsModel(
//       id: 3,
//       title: 'Dubai',
//       image: 'https://res.cloudinary.com/dtljonz0f/image/upload/c_auto,ar_4:3,w_1200,g_auto/f_auto/q_auto/v1/shutterstock_2414539851_ss_non-editorial_dcx0bm?_a=BAVHyiGg0',
//       subtitle: 'From New Delhi',
//     ),
//     HomeTopFlightsModel(
//       id: 4,
//       title: 'San Francisco',
//       image: 'https://cdn.britannica.com/13/77413-050-95217C0B/Golden-Gate-Bridge-San-Francisco.jpg',
//       subtitle: 'From New Delhi',
//     ),
//     HomeTopFlightsModel(
//       id: 5,
//       title: 'San Francisco',
//       image: 'https://cdn.britannica.com/13/77413-050-95217C0B/Golden-Gate-Bridge-San-Francisco.jpg',
//       subtitle: 'From New Delhi',
//     ),
//     HomeTopFlightsModel(
//       id: 6,
//       title: 'Dubai',
//       image: 'https://res.cloudinary.com/dtljonz0f/image/upload/c_auto,ar_4:3,w_1200,g_auto/f_auto/q_auto/v1/shutterstock_2414539851_ss_non-editorial_dcx0bm?_a=BAVHyiGg0',
//       subtitle: 'From Thiruvananthapuram',
//     ),
//   ];
// }

// List<HomeHotelDealModel> buildHotelDeals() {
//   return [
//     HomeHotelDealModel(
//       id: 1,
//       rating: 4.5,
//       title: 'Le Meridien Dubai Hotel & Conference Centre',
//       image: 'https://hblimg.mmtcdn.com/content/hubble/img/desttvimg/mmt/destination/t_trp/m_Bali_tv_destination_img_1_l_771_1158.jpg?im=Resize=(400,268)',
//       location: 'Airport Road',
//       review: '10k',
//       price: '532',
//       taxAmount: '587',
//     ),
//     HomeHotelDealModel(
//       id: 2,
//       title: 'Le Meridien Dubai Hotel & Conference Centre',
//       image: 'https://hblimg.mmtcdn.com/content/hubble/img/desttvimg/mmt/destination/t_trp/m_Bali_tv_destination_img_1_l_771_1158.jpg?im=Resize=(400,268)',
//       location: 'Airport Road',
//       rating: 4.5,
//       review: '10k',
//       price: '532',
//       taxAmount: '587',
//     ),
//     HomeHotelDealModel(
//       id: 3,
//       title: 'Le Meridien Dubai Hotel & Conference Centre',
//       image: 'https://hblimg.mmtcdn.com/content/hubble/img/desttvimg/mmt/destination/t_trp/m_Bali_tv_destination_img_1_l_771_1158.jpg?im=Resize=(400,268)',
//       location: 'Airport Road',
//       rating: 4.5,
//       review: '10k',
//       price: '532',
//       taxAmount: '587',
//     ),
//   ];
// }

List<HomeOfferModel> buildOffers() {
  return [
    HomeOfferModel(
      id: 1,
      image: 'https://images.pexels.com/photos/30356959/pexels-photo-30356959.jpeg?_gl=1*170qhtp*_ga*Mzk0MjExNjk0LjE3OTQ0ODk0Mzc.*_ga_8JE65Q40S6*czE3OTQ0ODk0MzYkbzEkZzAkdDE3OTQ0ODk0MzYkajYwJGwwJGgw',
      title: "Summer Escape Sale – Flat 20% Off on Hotels",
      promoCode: 'SMTTRAIN',
      categoryId: AppConstants.all_offer,
    ),
    HomeOfferModel(
      id: 2,
      image: 'https://images.pexels.com/photos/30356959/pexels-photo-30356959.jpeg?_gl=1*170qhtp*_ga*Mzk0MjExNjk0LjE3OTQ0ODk0Mzc.*_ga_8JE65Q40S6*czE3OTQ0ODk0MzYkbzEkZzAkdDE3OTQ0ODk0MzYkajYwJGwwJGgw',
      title: "New Year Sale – Flat 20% Off on Hotels",
      promoCode: 'NEWYEAR20',
      categoryId: AppConstants.flight,
    ),
    HomeOfferModel(
      id: 3,
      image: 'https://images.pexels.com/photos/30356959/pexels-photo-30356959.jpeg?_gl=1*170qhtp*_ga*Mzk0MjExNjk0LjE3OTQ0ODk0Mzc.*_ga_8JE65Q40S6*czE3OTQ0ODk0MzYkbzEkZzAkdDE3OTQ0ODk0MzYkajYwJGwwJGgw',
      title: "Diwali Sale – Flat 20% Off on Hotels",
      promoCode: 'DIWALI20',
      categoryId: AppConstants.train,
    ),
    HomeOfferModel(
      id: 4,
      image: 'https://images.pexels.com/photos/30356959/pexels-photo-30356959.jpeg?_gl=1*170qhtp*_ga*Mzk0MjExNjk0LjE3OTQ0ODk0Mzc.*_ga_8JE65Q40S6*czE3OTQ0ODk0MzYkbzEkZzAkdDE3OTQ0ODk0MzYkajYwJGwwJGgw',
      title: "Valentine's Sale – Flat 20% Off on Hotels",
      promoCode: 'VALENTINE20',
      categoryId: AppConstants.hotels,
    ),
    HomeOfferModel(
      id: 5,
      image: 'https://images.pexels.com/photos/30356959/pexels-photo-30356959.jpeg?_gl=1*170qhtp*_ga*Mzk0MjExNjk0LjE3OTQ0ODk0Mzc.*_ga_8JE65Q40S6*czE3OTQ0ODk0MzYkbzEkZzAkdDE3OTQ0ODk0MzYkajYwJGwwJGgw',
      title: "Black Friday Sale – Flat 20% Off on Hotels",
      promoCode: 'BLACKFRIDAY20',
      categoryId: AppConstants.buses,
    ),
  ];
}

List<HomeCategoryModel> buildCategories() {
  return [
    HomeCategoryModel(
      id: 1,
      title: AppConstants.flight,
      icon: Assets.plane,
      route: Routes.home,
    ),
    HomeCategoryModel(
      id: 2,
      title: AppConstants.train,
      icon: Assets.train,
      route: Routes.home,
    ),
    HomeCategoryModel(
      id: 3,
      title: AppConstants.hotels,
      icon: Assets.hotel,
      route: Routes.home,
    ),
    HomeCategoryModel(
      id: 4,
      title: AppConstants.buses,
      icon: Assets.bus,
      route: Routes.home,
    ),
  ];
}

List<HomeSubcategoryModel> buildSubcategories() {
  return [
    HomeSubcategoryModel(id: 1, title: AppConstants.cars, icon: Assets.car),
    HomeSubcategoryModel(
      id: 2,
      title: AppConstants.holiday,
      icon: Assets.holiday,
    ),
    HomeSubcategoryModel(
      id: 3,
      title: AppConstants.activities,
      icon: Assets.activities,
    ),
    HomeSubcategoryModel(
      id: 4,
      title: AppConstants.cruises,
      icon: Assets.cruise,
    ),
    HomeSubcategoryModel(
      id: 5,
      title: AppConstants.choppers,
      icon: Assets.choppers,
    ),
    HomeSubcategoryModel(
      id: 6,
      title: AppConstants.charteredPlanes,
      icon: Assets.flight,
    ),
    HomeSubcategoryModel(
      id: 7,
      title: AppConstants.insurance,
      icon: Assets.insurance,
    ),
    HomeSubcategoryModel(id: 8, title: AppConstants.visa, icon: Assets.visa),
  ];
}

List<HomeDynamicBannerModel> buildDynamicBanner() {
  return [
    HomeDynamicBannerModel(
      title: 'Save up to 30% on Delhi getaways',
      description: 'Use code',
      promoCode: 'DELHI30',
      descriptionSuffix: 'at checkout',
      bgImage: Assets.bannerBackground,
    ),
    HomeDynamicBannerModel(
      title: 'Flat 25% off on Goa beach stays',
      description: 'Use code',
      promoCode: 'GOA25',
      descriptionSuffix: 'on weekend bookings',
      bgImage: Assets.bannerBackground,
    ),
    HomeDynamicBannerModel(
      title: 'Explore royal Jaipur packages',
      description: 'Starting at ₹4,999 with free breakfast',
      bgImage: Assets.bannerBackground,
    ),
    HomeDynamicBannerModel(
      title: 'Escape to Manali hill resorts',
      description: 'Use code',
      promoCode: 'HILLS20',
      descriptionSuffix: 'for instant savings',
      bgImage: Assets.bannerBackground,
    ),
  ];
}
