import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      log("onCreate -- ${bloc.runtimeType}");
    }
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      log("onEvent -- ${bloc.runtimeType}, $event");
    }
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      log("onChange -- ${bloc.runtimeType}, $change");
    }
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      log("onTransition -- ${bloc.runtimeType}, $transition");
    }
    super.onTransition(bloc, transition);
  }
}
