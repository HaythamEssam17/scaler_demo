import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalers_demo/core/features/bottom_nav/presentation/logic/Bottom_Nav_Cubit/bottom_nav_cubit.dart';
import 'package:scalers_demo/core/features/connectivity_feature/presentation/logic/connectivity_cubit/connectivity_cubit.dart';
import 'package:scalers_demo/core/presentation/logic/search_filter_cubit/search_filter_cubit.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/cubit/job_details_cubit/jobs_details_cubit.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/cubit/jobs_cubit/jobs_feature_cubit.dart';

import 'injection_container.dart' as di;

class MultiBlocProvidersPage extends StatefulWidget {
  final Widget body;

  const MultiBlocProvidersPage({super.key, required this.body});

  @override
  State<StatefulWidget> createState() => _MultiBlocProvidersPageState();
}

class _MultiBlocProvidersPageState extends State<MultiBlocProvidersPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityCubit>(
          lazy: false,
          create: (_) => di.sl<ConnectivityCubit>(),
        ),
        BlocProvider<JobDetailsCubit>(
          lazy: false,
          create: (_) => di.sl<JobDetailsCubit>(),
        ),
        BlocProvider<AllFilterCubit>(create: (_) => di.sl<AllFilterCubit>()),
        BlocProvider<JobsFeatureCubit>(create: (_) => di.sl<JobsFeatureCubit>()),
        // BlocProvider<JobDetailsCubit>(create: (_) => di.sl<JobDetailsCubit>()),
        BlocProvider<BottomNavCubit>(create: (_) => di.sl<BottomNavCubit>()),
      ],
      child: widget.body,
    );
  }
}
