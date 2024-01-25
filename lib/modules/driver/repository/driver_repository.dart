import 'package:dio/dio.dart';
import 'package:moovbe_bus_booking/modules/driver/model/driver_common_models.dart';
import 'package:moovbe_bus_booking/modules/driver/model/driver_list_model.dart';
import 'package:moovbe_bus_booking/network/api_urls.dart';
import 'package:moovbe_bus_booking/utilities/shared_preference.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DriverRepository {
  Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

  Future<List<DriverListItemModel>> fetchDrivers() async {
    try {
      var bearerToken =
          SharePreferenceHelper.getValue(SharePreferenceHelper.tokenKey);
      Options options = Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          "Content-Type": "application/json"
        },
      );
      var response =
          await dio.get(ApiUrls.apiBase + ApiUrls.driverApi, options: options);
      if (response.statusCode == 200) {
        List<DriverListItemModel> list = List.generate(
            response.data["drivers"].length,
            (index) =>
                DriverListItemModel.fromJson(response.data["drivers"][index]));
        return list;
      }
      return [];
    } catch (e) {
      print('error : $e');
      throw Exception(e);
    }
  }

  Future<DriverDeleteResponseModel?> deleteDriver(int driverId) async {
     try {
      var bearerToken =
          SharePreferenceHelper.getValue(SharePreferenceHelper.tokenKey);
      Options options = Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          "Content-Type": "application/json"
        },
      );
      FormData formData = FormData.fromMap(
          {'driver_id': driverId});
      
      var response =
          await dio.delete(ApiUrls.apiBase + ApiUrls.driverApi, data: formData,options: options);
      return DriverDeleteResponseModel.fromJson(response.data);
    } catch (e) {
      print('error: $e');
      throw Exception(e);
    }
  }

  Future<DriverAddResponseModel> addDriver(
      String name, String license, String mobile) async {
    try {
      var bearerToken =
          SharePreferenceHelper.getValue(SharePreferenceHelper.tokenKey);
      Options options = Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          "Content-Type": "application/json"
        },
      );
      FormData formData = FormData.fromMap(
          {'name': name, 'license_no': license, 'mobile': mobile});
      
      var response =
          await dio.post(ApiUrls.apiBase + ApiUrls.driverApi, data: formData,options: options);
      return DriverAddResponseModel.fromJson(response.data);
    } catch (e) {
      print('error: $e');
      throw Exception(e);
    }
  }
}
