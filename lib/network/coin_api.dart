import 'package:dio/dio.dart';
import 'package:end/core/constants.dart';
import 'package:end/models/coin_detail_model.dart';
import 'package:end/models/coin_model.dart';
import 'package:end/models/search_model.dart';

class CoinApi {

  Future<List<CoinModel>> getAllCoin()async{

    try {
      final response = await Dio().get(baseUrl + allCoinEndPoint);

      return
        List<CoinModel>.from(
            response.data.map((x) => CoinModel.fromJson(x)));
    } catch(e){
      rethrow;
    }
  }

  Future<CoinDetailsModel> getCoinDetails(String id)async{

    try {
      final response = await Dio().get(baseUrl + coinDetailsEndPoint + id);
      print(response.data);
      return CoinDetailsModel.fromJson(response.data);
    } on DioError catch(e){
      print(e.response!.data);
      rethrow ;
    }
  }

  Future<List<SearchModel>> SearchCoin(String value)async{

    try {
      final response = await Dio().get(baseUrl + searchCoinEndPoint + value);
      print('Tesssssssssssssssssst 1111');
      print('Tesssssssssssssssssst 1111');
      print('Tesssssssssssssssssst 1111');
      print(response.data);
      return List<SearchModel>.from(
          response.data['coins'].map((x) => SearchModel.fromJson(x)));
    } catch(e){
      print(e);
      throw e;
    }
  }
}