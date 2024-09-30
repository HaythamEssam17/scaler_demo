abstract class JobDetailsState {}

class JobDetailsInitial extends JobDetailsState {}

class JobDetailsLoading extends JobDetailsState {}

class JobDetailsSuccess extends JobDetailsState {}

class JobDetailsFailed extends JobDetailsState {
  final String message;
  JobDetailsFailed(this.message);
}
