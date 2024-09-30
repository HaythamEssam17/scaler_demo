import 'package:dartz/dartz.dart';
import 'package:scalers_demo/core/network/error_handling/custom_error.dart';
import 'package:scalers_demo/features/jobs_feature/data/models/job_model.dart';
import 'package:scalers_demo/features/jobs_feature/domain/repositories/jobs_repository.dart';

class JobUseCases {
  final IJobsRepository _iJobsRepository;

  JobUseCases(this._iJobsRepository);

  Future<Either<CustomError, List<JobModel>>> getJobsList() async {
    return _iJobsRepository.getJobsList();
  }

  Future<Either<CustomError, JobModel>> getJobDetails({required String uuid}) {
    return _iJobsRepository.getJobDetails(uuid: uuid);
  }
}
