import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:watchlist_contact_app/model/user_model.dart';

@immutable 
abstract class UsersState extends Equatable {
  
}

// data loading state
class UserLoadingState extends UsersState {
  
  @override
  List<Object?> get props => [];
}

// data loaded state
class UserLoadedState extends UsersState {

  final List<List<UserModel>> splittedUser;
  UserLoadedState(this.splittedUser);  // Constructor
  
  @override
  List<Object?> get props => [splittedUser];
}


// data loading error state
class UserErrorState extends UsersState {

  final String error;
  UserErrorState(this.error);   // Constructor
  
  @override
  List<Object?> get props => [error];
}


// sorting
class SortState extends UsersState {

  final List<List<UserModel>> splittedUser;
  SortState(this.splittedUser);  

  @override
  List<Object?> get props => [splittedUser];
}