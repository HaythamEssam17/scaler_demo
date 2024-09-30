import 'package:get_it/get_it.dart';
import 'package:scalers_demo/core/features/bottom_nav/presentation/logic/Bottom_Nav_Cubit/bottom_nav_cubit.dart';
import 'package:scalers_demo/core/features/connectivity_feature/data/data_source/remote_data_source.dart';
import 'package:scalers_demo/core/features/connectivity_feature/data/repository/connectivity_repository.dart';
import 'package:scalers_demo/core/features/connectivity_feature/domain/interface/connectivity_interface.dart';
import 'package:scalers_demo/core/features/connectivity_feature/domain/use_case/connectivity_use_case.dart';
import 'package:scalers_demo/core/features/connectivity_feature/presentation/logic/connectivity_cubit/connectivity_cubit.dart';
import 'package:scalers_demo/core/presentation/logic/search_filter_cubit/search_filter_cubit.dart';
import 'package:scalers_demo/features/jobs_feature/data/datasources/job_data_source.dart';
import 'package:scalers_demo/features/jobs_feature/data/datasources/job_data_source_impl.dart';
import 'package:scalers_demo/features/jobs_feature/data/repositories/job_repository_impl.dart';
import 'package:scalers_demo/features/jobs_feature/domain/repositories/jobs_repository.dart';
import 'package:scalers_demo/features/jobs_feature/domain/usecases/job_use_cases.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/cubit/job_details_cubit/jobs_details_cubit.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/cubit/jobs_cubit/jobs_feature_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Blocs
  sl.registerFactory(() => ConnectivityCubit());
  sl.registerFactory(() => JobsFeatureCubit(sl()));
  sl.registerFactory(() => JobDetailsCubit(sl()));
  sl.registerFactory(() => AllFilterCubit());
  sl.registerFactory(() => BottomNavCubit());

  ///User cases
  sl.registerLazySingleton(() => ConnectivityUseCase(sl()));
  sl.registerLazySingleton(() => JobUseCases(sl()));

  ///repos
  sl.registerLazySingleton<ConnectivityInterface>(() => ConnectivityRepository(remoteDataSourceInterface: sl()));
  sl.registerLazySingleton<IJobsRepository>(() => JobRepositoryImpl(sl()));

  ///auth local data source interface
  /// ...

  ///auth remote data source interface
  sl.registerLazySingleton<ConnectivityRemoteDataSourceInterface>(() => ConnectivityRemoteDataSourceImp());
  sl.registerLazySingleton<JobsDataSource>(() => JobsDataSourceImpl());
}
