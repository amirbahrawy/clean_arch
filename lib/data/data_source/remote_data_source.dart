import 'package:clean_architecture/data/network/app_api.dart';
import 'package:clean_architecture/data/response/responses.dart';

import '../network/requests.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        email: loginRequest.email, password: loginRequest.password);
  }
}
