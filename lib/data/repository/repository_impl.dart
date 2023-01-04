import 'package:clean_architecture/data/mapper/mapper.dart';
import 'package:dartz/dartz.dart';
import '../../domain/model/models.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../network/requests.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      //its connected to internet , its safe to call API
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.success) {
          //success return data
          return Right(response.toDomain());
        } else {
          //failure -- return business error
          return Left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //return internet connection error
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
