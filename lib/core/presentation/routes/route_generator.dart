import 'package:flutter/material.dart';
import 'package:scalers_demo/core/features/bottom_nav/presentation/Screens/Bottom_Nav_Screen/bottom_nav_bar.dart';
import 'package:scalers_demo/core/helpers/shared.dart';
import 'package:scalers_demo/core/presentation/routes/route_animation.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/pages/job_details_home_page.dart';

import 'route_names.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    devLog('Route: new route ---> ${settings.name!}');

    switch (settings.name) {
      case RouteNames.mainBottomNavPageRoute:
        return RouteAnimation().animationFromCenterRightToCenterLeft(page: const BottomNavBarHomePage());

      case RouteNames.jobDetailsHomePage:
        return RouteAnimation().animationFromCenterRightToCenterLeft(page: const JobDetailsHomePage());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: SafeArea(
              child: Text('presentation.Route Error'),
            ),
          ),
        );
    }
  }
}
