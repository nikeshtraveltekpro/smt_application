import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/src/modules/hotels/models/popular_destination_model.dart';

class HotelRepositoriesException implements Exception {
  final String msg;

  HotelRepositoriesException({required this.msg});

  @override
  String toString() => msg;
}

class HotelRepositories {
  Future<List<PopularDestinationModel>> fetchPopularDestination() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return await buildPopulerDestination();
    } on HotelRepositoriesException {
      rethrow;
    } catch (e) {
      throw HotelRepositoriesException(
        msg: "Exception Occur In Hotel Deals : ${e.toString()}",
      );
    }
  }
}

Future<List<PopularDestinationModel>> buildPopulerDestination() async {
  try {
    final data = await rootBundle.loadString(Assets.popularDestination);
    final decodedData = jsonDecode(data);
    if (decodedData is! List) {
      throw 'Response is not List';
    }
    final List<PopularDestinationModel> reponse = decodedData
        .map((item) => PopularDestinationModel.fromJson(item))
        .toList();

    return reponse;
  } on HotelRepositoriesException {
    rethrow;
  } catch (e) {
    throw HotelRepositoriesException(
      msg: "Exception Occur In Hotel Deals : ${e.toString()}",
    );
  }
}
