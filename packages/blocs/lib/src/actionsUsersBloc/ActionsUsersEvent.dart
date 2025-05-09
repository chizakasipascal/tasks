import 'package:equatable/equatable.dart';

abstract class ActionsUsersEvent extends Equatable {
  const ActionsUsersEvent();

  @override
  List<Object> get props => [];
}

class LoadActionsUsersEvent extends ActionsUsersEvent {}

class RefreshActionsUsersEvent extends ActionsUsersEvent {}
