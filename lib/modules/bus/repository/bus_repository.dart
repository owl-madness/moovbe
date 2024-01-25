import 'package:dio/dio.dart';
import 'package:moovbe_bus_booking/modules/bus/model/bus_list_item_model.dart';
import 'package:moovbe_bus_booking/network/api_urls.dart';
import 'package:moovbe_bus_booking/utilities/shared_preference.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BusRepository {
 Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

  Future<List<BusListItemModel>> fetchBuses() async {
    try {
      var bearerToken =
          SharePreferenceHelper.getValue(SharePreferenceHelper.tokenKey);
      Options options = Options(
        headers: {'Authorization': 'Bearer $bearerToken', "Content-Type":"application/json"},
      );
      var response =
          await dio.get(ApiUrls.apiBase + ApiUrls.busListApi, options: options);
      if (response.statusCode == 200) {
        List<BusListItemModel> list = List.generate(response.data["bus"].length,
            (index) => BusListItemModel.fromJson(response.data["bus"][index]));
        return list;
      }
      return [];
    } catch (e) {
      print('error : $e');
      throw Exception(e);
    }
  }
}
