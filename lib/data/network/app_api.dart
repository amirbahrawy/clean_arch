import 'package:clean_architecture/data/response/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../app/constants.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(Constants.login)
  Future<AuthenticationResponse> login({
    @Field("email") required String email,
    @Field("password") required String password,
  });
}
