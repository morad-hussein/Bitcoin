import 'package:dio/dio.dart';
import 'package:end/models/search_model.dart';
import 'package:end/network/coin_api.dart';
import 'package:end/network/dio_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProvider extends ChangeNotifier {


  List<SearchModel> searchCoins = [];
  List<SearchModel> filterSearchCoins = [];

  void getSearchCoin(String value) async {
    try {
      CoinApi().SearchCoin(value).then((val) {
        print('#################');
        print('#################');
        print('test $val');
        searchCoins = val;
        print(searchCoins);
        notifyListeners();
      });
    } on DioError catch (e) {
      String error = DioExceptions.fromDioError(e).toString();
      Get.dialog(AlertDialog(
        title: Text('Error'),
        content: Text(error),
        actions: [
          TextButton(
              onPressed: () {
                getSearchCoin(value);
                Get.back();
              },
              child: Text('Ok'))
        ],
      ));
    }
  }
}