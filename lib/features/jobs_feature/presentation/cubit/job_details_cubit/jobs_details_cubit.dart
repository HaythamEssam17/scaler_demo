import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalers_demo/features/jobs_feature/data/models/job_model.dart';
import 'package:scalers_demo/features/jobs_feature/domain/usecases/job_use_cases.dart';

import 'jobs_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  JobDetailsCubit(this._jobUseCases) : super(JobDetailsInitial());

  final JobUseCases _jobUseCases;

  JobModel jobModel = JobModel();

  void getJobDetails({required String uuid}) async {
    jobModel = JobModel();

    emit(JobDetailsLoading());

    var result = await _jobUseCases.getJobDetails(uuid: uuid);

    result.fold(
      (error) => emit(JobDetailsFailed(error.errorMassage!)),
      (job) {
        jobModel = job;
        jobModel.icpAnswers!.getFullDescriptionFromJobRole();

        emit(JobDetailsSuccess());
      },
    );
  }
}
