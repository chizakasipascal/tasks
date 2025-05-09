import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

abstract class ActionsUsersState extends Equatable {
  const ActionsUsersState();

  @override
  List<Object> get props => [];
}

class ActionsUsersInitialState extends ActionsUsersState {}

class ActionsUsersRefreshState extends ActionsUsersState {}

class ActionsUsersFailureLoadedState extends ActionsUsersState {
  final int? status;

  const ActionsUsersFailureLoadedState({this.status});

  @override
  List<Object> get props => [status!];
}

class ActionsUsersSuccessLoadedState extends ActionsUsersState {
  final List<ActionsListsForUsers> actionsUsersModel;

  const ActionsUsersSuccessLoadedState({required this.actionsUsersModel});

  ActionsUsersSuccessLoadedState copyWith({
    required List<ActionsListsForUsers>? ActionsUsers,
    required bool? hasReachedMax,
  }) {
    return ActionsUsersSuccessLoadedState(
      actionsUsersModel: actionsUsersModel!,
    );
  }

  @override
  List<Object> get props => [actionsUsersModel];
}
