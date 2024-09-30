import 'package:flutter/material.dart';
import 'package:scalers_demo/core/features/bottom_nav/presentation/Screens/Bottom_Nav_Screen/bottom_nav_bar.dart';
import 'package:scalers_demo/core/utils/app_config/multi_bloc_provider_page.dart';

import 'app_lifycycle_observer.dart';
import 'main_app_material_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const AppLifecycleObserver(
      child: MultiBlocProvidersPage(
        body: AppMaterialWidget(
          homeWidget: BottomNavBarHomePage(),
        ),
      ),
    );
  }
}
