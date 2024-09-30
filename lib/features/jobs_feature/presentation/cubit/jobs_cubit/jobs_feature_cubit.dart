import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalers_demo/features/jobs_feature/data/models/job_model.dart';
import 'package:scalers_demo/features/jobs_feature/domain/usecases/job_use_cases.dart';

import 'jobs_feature_state.dart';

class JobsFeatureCubit extends Cubit<FetchJobsFeatureState> {
  JobsFeatureCubit(this._jobUseCases) : super(FetchJobsFeatureInitial());

  final JobUseCases _jobUseCases;

  List<JobModel> jobsList = [];

  void getJobsList() async {
    jobsList.clear();

    emit(FetchJobsFeatureLoading());

    var result = await _jobUseCases.getJobsList();

    result.fold(
      (error) => emit(FetchJobsFeatureFailed(error.errorMassage!)),
      (jobs) {
        jobsList = jobs;

        emit(FetchJobsFeatureSuccess());
      },
    );
  }
}
