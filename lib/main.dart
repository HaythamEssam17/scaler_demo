import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scalers_demo/core/app/my_app.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/helpers/observers/bloc_observer.dart';
import 'package:scalers_demo/core/network/dio_helper.dart';
import 'package:scalers_demo/core/network/error_handling/dio_exception.dart';
import 'package:scalers_demo/core/utils/app_config/injection_container.dart' as di;

void main() async {
  // final WidgetsBinding bind =
  WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.preserve(widgetsBinding: bind);

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.whiteColor,
      systemNavigationBarColor: AppColors.greyColor.withOpacity(0.5),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  FlutterError.onError = DioExceptions.onFlutterError;

  /// Initialize .Env Enviroment to load the file.
  await dotenv.load();

  /// Initialize the Injections
  await di.init();

  /// Initialize Dio SIngleton Instance
  DioHelper.instance;

  Bloc.observer = MyBlocObserver();

  runApp(
    const MyApp(),
  );
}
