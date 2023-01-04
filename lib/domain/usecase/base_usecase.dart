import 'package:clean_architecture/data/network/failure.dart';
import 'package:dartz/dartz.dart';

// it has input that get from view model and output will receive from data layer and send it to view model
abstract class BaseUseCase <In,Out>{
  Future<Either<Failure,Out>> execute(In input);
}
