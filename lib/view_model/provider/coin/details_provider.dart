import 'package:dio/dio.dart';
import 'package:end/models/coin_detail_model.dart';
import 'package:end/network/coin_api.dart';
import 'package:end/network/dio_exceptions.dart';
import 'package:end/screens/coin/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsProvider extends ChangeNotifier {
  CoinDetailsModel? coinDetails;

  bool isLoading = false;


  getCoinDetails(String id) async {
    isLoading = true;
    try {
      await CoinApi().getCoinDetails(id).then((value) {
        coinDetails = value;
        print("Fuck");
        isLoading = false;
        notifyListeners();
      });
    } on DioError catch (e) {
      String error = DioExceptions.fromDioError(e).toString();
      isLoading = false;

    }

  }
}