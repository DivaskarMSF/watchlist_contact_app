import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UsersEvent extends Equatable {
  const UsersEvent();
}

class LoadUsersEvent extends UsersEvent {

  @override
  List<Object?> get props => [];
}

class SortEvent extends UsersEvent {
  final int selectedTabIndex;
  final String sortType;

  const SortEvent({required this.selectedTabIndex, required this.sortType});

  @override
  List<Object?> get props => [];

}

