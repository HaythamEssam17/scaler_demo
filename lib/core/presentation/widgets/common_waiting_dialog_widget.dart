import 'package:flutter/material.dart';
import 'package:scalers_demo/core/factories/circular_indicator_factory.dart';

Future showWaitingDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false, // Put it False to prevent user from back.
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          contentPadding: EdgeInsets.zero,
          content: PlatformCircularIndictor.buildCircular(context: context),
        ),
      );
    },
  );
}
