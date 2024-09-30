import 'package:dartz/dartz.dart';
import 'package:scalers_demo/core/network/error_handling/custom_error.dart';
import 'package:scalers_demo/features/jobs_feature/data/datasources/job_data_source.dart';
import 'package:scalers_demo/features/jobs_feature/data/models/job_model.dart';
import 'package:scalers_demo/features/jobs_feature/domain/repositories/jobs_repository.dart';

class JobRepositoryImpl implements IJobsRepository {
  final JobsDataSource _jobsDataSource;

  JobRepositoryImpl(this._jobsDataSource);

  @override
  Future<Either<CustomError, JobModel>> getJobDetails({required String uuid}) async {
    return _jobsDataSource.getJobDetails(uuid: uuid).then(
          (value) => value.fold(
            (l) => left(l),
            (r) => right(
              JobModel.fromJson(r.data),
            ),
          ),
        );
  }

  @override
  Future<Either<CustomError, List<JobModel>>> getJobsList() {
    return _jobsDataSource.getJobsList().then(
          (value) => value.fold(
            (l) => left(l),
            (r) {
              List<JobModel> jobs = [];
              for (var i in r.data) {
                jobs.add(JobModel.fromJson(i['job']));
              }

              return right(jobs);
            },
          ),
        );
  }
}
