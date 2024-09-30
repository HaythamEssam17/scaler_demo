import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:scalers_demo/core/model/base_model.dart';
import 'package:scalers_demo/core/network/dio_base_execute.dart';
import 'package:scalers_demo/core/network/dio_helper.dart';
import 'package:scalers_demo/core/network/error_handling/custom_error.dart';
import 'package:scalers_demo/core/utils/app_config/app_configs.dart';

import 'job_data_source.dart';

class JobsDataSourceImpl implements JobsDataSource {
  @override
  Future<Either<CustomError, BaseModel>> getJobDetails({required String uuid}) async {
    String url = '${AppConfig.jobs!}/$uuid';

    return executeAndHandleError(
      () async {
        Response response = await DioHelper.instance.getDate(url: url);

        return BaseModel.fromJson(response.data);
      },
    );
  }

  @override
  Future<Either<CustomError, BaseModel>> getJobsList() async {
    String url = AppConfig.jobs!;

    return executeAndHandleError(
      () async {
        Response response = await DioHelper.instance.getDate(url: url);

        return BaseModel.fromJson(response.data);
      },
    );
  }
}
