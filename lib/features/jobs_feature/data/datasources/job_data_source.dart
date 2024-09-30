import 'package:dartz/dartz.dart';
import 'package:scalers_demo/core/model/base_model.dart';
import 'package:scalers_demo/core/network/error_handling/custom_error.dart';

abstract class JobsDataSource {
  Future<Either<CustomError, BaseModel>> getJobsList();

  Future<Either<CustomError, BaseModel>> getJobDetails({required String uuid});
}
