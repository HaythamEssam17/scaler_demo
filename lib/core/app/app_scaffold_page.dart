import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalers_demo/core/app/main_app_material_widget.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/features/connectivity_feature/presentation/logic/connectivity_cubit/connectivity_cubit.dart';
import 'package:scalers_demo/core/features/connectivity_feature/presentation/logic/connectivity_cubit/connectivity_states.dart';
import 'package:scalers_demo/core/features/connectivity_feature/presentation/screens/no_connection_screen.dart';
import 'package:scalers_demo/core/helpers/extensions/context_extensions.dart';
import 'package:scalers_demo/core/helpers/shared.dart';
import 'package:scalers_demo/core/helpers/shared_texts.dart';

class AppScaffoldPage extends StatefulWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;

  const AppScaffoldPage({super.key, required this.body, this.appBar, this.bottomNavigationBar});

  @override
  State<AppScaffoldPage> createState() => _AppScaffoldPageState();
}

class _AppScaffoldPageState extends State<AppScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      appBar: widget.appBar,
      bottomNavigationBar: widget.bottomNavigationBar,
      body: GestureDetector(
        onTap: () => context.hideKeyboard(),
        child: BlocConsumer<ConnectivityCubit, ConnectivityState>(
          listener: (BuildContext connectivityCxt, ConnectivityState connectivityState) {
            devLog('connectivityState: from state $connectivityState');
          },
          builder: (BuildContext context, ConnectivityState connectivityState) {
            if (connectivityState is InternetDisconnected) {
              return const AppMaterialWidget(
                homeWidget: NoConnectionScreen(),
              );
            }

            /// This is the main body
            return SizedBox(
              height: SharedText.screenHeight,
              width: SharedText.screenWidth,
              child: widget.body,
            );
          },
        ),
      ),
    );
  }
}
