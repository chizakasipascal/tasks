import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:task/src/app.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('Main.MyBlocObserver.OnEvent ::: EVENT: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('Main.MyBlocObserver.OnTransition ::: TRANSITION: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('Main.MyBlocObserver.onChange ::: CHANGER: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('Main.MyBlocObserver.OnError ::: '
        'ERROR: $error & STACKTRACE: $stackTrace');
  }
}

void main() {
  Bloc.observer = MyBlocObserver();
  // MultiBlocProvider(
  //   providers: [
  //     BlocProvider<ActionsUsersBloc>(
  //       create: (context) => ActionsUsersBloc(),
  //     ),
  //   ],
  //   child: const TasksApp(),
  // );
  runApp(const TasksApp());
}
