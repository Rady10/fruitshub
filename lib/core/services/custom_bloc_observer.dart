import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if(kDebugMode){
      log('[Bloc: ${bloc.runtimeType}] State changed: $change');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if(kDebugMode){
      log('[Bloc: ${bloc.runtimeType}] Transition: $transition');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if(kDebugMode){
      log('[Bloc: ${bloc.runtimeType}] Error: $error');
    }
  }
}