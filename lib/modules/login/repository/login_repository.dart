import 'package:dio/dio.dart';
import 'package:moovbe_bus_booking/modules/login/model/login_response_model.dart';
import 'package:moovbe_bus_booking/network/api_urls.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LoginRepository {
  Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    //   InterceptorsWrapper(
    //   onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    //     print('Request ${options.method} ${options.path}');
    //     // return options;
    //   },
    //   onResponse: (Response response, ResponseInterceptorHandler handler) {
    //     print('Response ${response.statusCode}');
    //     // return response;
    //   },
    //   onError: (DioException error, ErrorInterceptorHandler handler) {
    //     print('Error ${error.message}');
    //     // return error;
    //   },
    // ));

  Future<LoginResponseModel?> checkLogin(
      String username, String password) async {
    try {
      FormData formData = FormData.fromMap({
        'username': username,
        'password': password,
      });
      var response =
          await dio.post(ApiUrls.apiBase + ApiUrls.loginApi, data: formData);
      if (response.statusCode == 200) {
        LoginResponseModel model = LoginResponseModel.fromJson(response.data);
        return model;
      }
      return null;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
