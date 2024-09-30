import 'package:dartz/dartz.dart';
import 'package:scalers_demo/core/network/error_handling/custom_error.dart';
import 'package:scalers_demo/features/jobs_feature/data/models/job_model.dart';

abstract class IJobsRepository {
  Future<Either<CustomError, List<JobModel>>> getJobsList();

  Future<Either<CustomError, JobModel>> getJobDetails({required String uuid});
}
