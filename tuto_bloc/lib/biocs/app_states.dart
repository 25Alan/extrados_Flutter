import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tuto_bloc/models/models.dart';

@immutable
abstract class UserState extends Equatable {}

//data loading state
class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final List<PokeModel> users;
  UserLoadedState(this.users);

  @override
  List<Object> get props => [users];
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);

  @override
  List<Object> get props => [error];
}

//data loading state
//x.obs bool loading = true loading=false

//data error loading state 