import 'package:dartz/dartz.dart';
import 'package:scalers_demo/core/model/base_model.dart';
import 'package:scalers_demo/core/network/error_handling/custom_error.dart';
import 'package:scalers_demo/core/network/error_handling/custom_exception.dart';

Future<Either<CustomError, BaseModel>> executeAndHandleError(Future<BaseModel> Function() function) async {
  try {
    final BaseModel result = await function();
    return right(result);
  } on CustomException catch (ex) {
    return Left(
      CustomError(
        type: ex.type,
        errorMassage: ex.errorMassage,
        imgPath: ex.imgPath,
      ),
    );
  }
}
