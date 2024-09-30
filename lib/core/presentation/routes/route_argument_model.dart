import 'package:flutter/material.dart';
import 'package:scalers_demo/features/jobs_feature/data/models/job_model.dart';

import '../../constants/enums/reason_key_enum.dart';

class RouteArgument {
  String? id;
  String? sourcePage;
  String? imagePath;
  String? userCredential;

  ReasonKey? reasonsKey;

  Widget? mainBody;
  PreferredSizeWidget? appBar;

  JobModel? jobModel;

  /// Appbar
  bool? withBack;
  bool? withActions;
  bool? withAppBar;
  Widget? titleWidget;

  /// Functions
  Function()? onTap;
  String? otp;

  ///Terms
  String? screenName;
  String? endPoint;

  RouteArgument({
    this.id,
    this.sourcePage = '',
    this.appBar = const PreferredSize(preferredSize: Size.fromHeight(0), child: SizedBox()),
    this.mainBody,
    this.titleWidget,
    this.withBack = false,
    this.withActions = false,
    this.withAppBar = false,
    // this.doctorModel,
    this.imagePath,
    this.userCredential,
    this.onTap,
    this.otp,
    this.reasonsKey,
    this.screenName,
    this.endPoint,
    this.jobModel,
  });
}

class RouteArguments {
  static String uuid = '';
}
