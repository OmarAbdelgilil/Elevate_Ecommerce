import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    printToConsole('Bloc Event: ${bloc.runtimeType}, Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    printToConsole(
        'Bloc Transition: ${bloc.runtimeType}, Transition: $transition');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    printToConsole('Bloc Change: ${bloc.runtimeType}, Change: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    printToConsole('Bloc Error: ${bloc.runtimeType}, Error: $error');
  }
}
