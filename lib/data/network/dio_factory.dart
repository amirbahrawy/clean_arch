import 'package:clean_architecture/app/app_prefs.dart';
import 'package:clean_architecture/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String authorization = 'authorization';
const String defaultLanguage = 'language';

class DioFactory {
  final AppPreferences _appPreferences;


  DioFactory(this._appPreferences);

   Future<Dio> getDio() async {
    Dio dio = Dio();
    String language=await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: Constants.token,
      defaultLanguage: language // get it from app prefs
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: headers,
        receiveTimeout: Constants.apiTimeOut,
        sendTimeout: Constants.apiTimeOut);

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
    return dio;
  }
}
