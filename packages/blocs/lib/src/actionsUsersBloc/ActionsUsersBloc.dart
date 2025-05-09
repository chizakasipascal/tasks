import 'package:bloc/bloc.dart';
import 'package:blocs/src/actionsUsersBloc/ActionsUsersEvent.dart';
import 'package:request/request.dart';
import 'package:flutter/foundation.dart';
import 'ActionsUsersState.dart';

class ActionsUsersBloc extends Bloc<ActionsUsersEvent, ActionsUsersState> {
  final ApiRepository api = ApiRepository();

  ActionsUsersBloc() : super(ActionsUsersInitialState()) {
    on<LoadActionsUsersEvent>(((event, emit) async {
      final currentState = state;

      try {
        emit(ActionsUsersInitialState());

        if (currentState is ActionsUsersInitialState) {
          final actionUsersData = await api.getActionsListsForUsers(
            token: "", // pass the id user to get informations
          );

          emit(
            ActionsUsersSuccessLoadedState(
              actionsUsersModel: [actionUsersData],
            ),
          );
          debugPrint("is CommissionInitial");
          // return;
        }
        if (currentState is ActionsUsersSuccessLoadedState) {
          final actionUsersData = await api.getActionsListsForUsers(
            token: "", // pass the id user to get informations
          );
          emit(
            ActionsUsersSuccessLoadedState(
              actionsUsersModel: currentState.actionsUsersModel,
            ),
          );
          debugPrint("is CommmsionSuccess");
        }
      } catch (error, stackTrace) {
        debugPrint('CommissionsBloc.MapEventToState :::'
            'ERROR: $error, STACKTRACE: $stackTrace');
        emit(const ActionsUsersFailureLoadedState(/*status: error)*/));
      }
    }));
    on<RefreshActionsUsersEvent>(((event, emit) async {
      try {
        emit(ActionsUsersRefreshState());
        final actionUsersData = await api.getActionsListsForUsers(
            token: ""); // pass the id user to get informations
        emit(
          ActionsUsersSuccessLoadedState(
            actionsUsersModel: [actionUsersData],
          ),
        );

        return;
      } catch (error, stackTrace) {
        debugPrint('ActionsUsersFailureLoadedStateBloc.MapEventToState :::'
            'ERROR: $error, STACKTRACE: $stackTrace');
        emit(const ActionsUsersFailureLoadedState(/*status: error*/));
      }
    }));
  }
}
