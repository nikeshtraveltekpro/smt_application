import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/home/models/home_category_model.dart';
import 'package:smt_application/src/modules/home/models/home_content_model.dart';
import 'package:smt_application/src/modules/home/models/home_dynamic_banner_model.dart';
import 'package:smt_application/src/modules/home/models/home_hotel_deal_model.dart';
import 'package:smt_application/src/modules/home/models/home_offer_model.dart';
import 'package:smt_application/src/modules/home/models/home_subcategory_model.dart';
import 'package:smt_application/src/modules/home/models/home_top_flights_model.dart';
import 'package:smt_application/src/modules/home/repository/home_repository.dart';
import 'package:smt_application/utils/app_constants.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;
  HomeController(this.homeRepository);
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  final PageController bannerPageController = PageController();
  RxString errorMsg = ''.obs;
  RxInt bannerCurrentIndex = 0.obs;
  RxList<HomeCategoryModel> homeCategory = <HomeCategoryModel>[].obs;
  RxList<HomeSubcategoryModel> homeSubCategory = <HomeSubcategoryModel>[].obs;
  RxList<HomeHotelDealModel> homeHotelDeal = <HomeHotelDealModel>[].obs;
  RxList<HomeOfferModel> homeOffer = <HomeOfferModel>[].obs;
  RxList<HomeOfferModel> filterOffer = <HomeOfferModel>[].obs;
  RxList<HomeTopFlightsModel> homeTopFlights = <HomeTopFlightsModel>[].obs;
  RxList<HomeDynamicBannerModel> homeDynamicBanner =
      <HomeDynamicBannerModel>[].obs;
  RxString selectedOffer = AppConstants.all_offers.obs;

  @override
  void onInit() {
    super.onInit();
    getHomeContent();
  }

  Future<void> getHomeContent() async {
    isLoading(true);
    hasError(false);
    errorMsg('');
    try {
      final HomeContentModel content = await homeRepository.fetchHomeContent();
      homeCategory.assignAll(content.categories);
      homeSubCategory.assignAll(content.subcategories);
      homeOffer.assignAll(content.offers);
      homeDynamicBanner.assignAll(content.dynamicBanners);
      homeHotelDeal.assignAll(content.hotelDeals);
      homeTopFlights.assignAll(content.topFlights);
      applyOffer(selectedOffer.value);
    } on HomeRepositoryException {
      hasError(true);
      errorMsg("Home Repository Exception");
    } catch (e) {
      hasError(true);
      errorMsg(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void selectOffer(String filterId) {
    selectedOffer(filterId);
    applyOffer(filterId);
  }

  void applyOffer(String filterId) {
    if (filterId == AppConstants.all_offers) {
      filterOffer.assignAll(homeOffer);
      return;
    }
    filterOffer.assignAll(
      homeOffer.where((item) => item.categoryId == filterId).toList(),
    );
  }

  void onSwapBanner(int index) {
    bannerCurrentIndex.value = index;
  }

  @override
  void onClose() {
    bannerPageController.dispose();
    super.onClose();
  }
}
