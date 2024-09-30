import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalers_demo/core/features/connectivity_feature/presentation/logic/connectivity_cubit/connectivity_states.dart';
import 'package:scalers_demo/core/helpers/shared.dart';
import 'package:scalers_demo/core/network/error_handling/custom_exception.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  ConnectivityCubit() : super(InternetLoading()) {
    try {
      _subscription = _connectivity.onConnectivityChanged.listen(
        (result) {
          bool isNotConnected = result.contains(ConnectivityResult.none);

          if (isNotConnected) {
            emit(InternetDisconnected());
          } else {
            emit(InternetConnected());
          }
        },
      );
    } on CustomException catch (e) {
      devLog('Failed to check connection: $e');
      emit(InternetDisconnected());
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
