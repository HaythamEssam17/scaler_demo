abstract class FetchJobsFeatureState {}

class FetchJobsFeatureInitial extends FetchJobsFeatureState {}

class FetchJobsFeatureLoading extends FetchJobsFeatureState {}

class FetchJobsFeatureSuccess extends FetchJobsFeatureState {}

class FetchJobsFeatureFailed extends FetchJobsFeatureState {
  final String message;
  FetchJobsFeatureFailed(this.message);
}
