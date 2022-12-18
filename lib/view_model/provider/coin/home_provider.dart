import 'package:dio/dio.dart';
import 'package:end/models/coin_model.dart';
import 'package:end/network/coin_api.dart';
import 'package:end/network/dio_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProvider extends ChangeNotifier {

  List<CoinModel> coins = [];

  HomeProvider(){
    getAllCoin();
  }

  void getAllCoin() async {
    try {
      await CoinApi().getAllCoin().then((value) {
        coins = value;
        notifyListeners();
      });
    } on DioError  catch (e) {
      String error = DioExceptions.fromDioError(e).toString();
      print(error);

      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () {
                getAllCoin();
                Get.back();
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );

    }
  }


// void getAllCoin() async {
//   try {
//     await CoinApi().getAllCoin().then((value) {
//       coins = value;
//       notifyListeners();
//     });
//
//   } on DioError catch (e) {
//     String error = DioExceptions.fromDioError(e).toString();
//     Get.dialog(AlertDialog(
//       title: Text('Error'),
//       content: Text(error),
//       actions: [
//         TextButton(
//             onPressed: () {
//               getAllCoin();
//               Get.back();
//             },
//             child: Text('Ok'))
//       ],
//     ));
//   }
// }
}