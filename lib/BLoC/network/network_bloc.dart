import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/BLoC/network/network_event.dart';
import 'package:stock_app/BLoC/network/network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  late StreamSubscription subscription;

  NetworkBloc() : super(Checking()) {
    on<Connected>(
      (event, emit) {
        emit(Online());
      },
    );
    on<Disconnected>(
      (event, emit) => emit(Offline()),
    );

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(Connected());
      } else {
        add(Disconnected());
      }
    });
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
