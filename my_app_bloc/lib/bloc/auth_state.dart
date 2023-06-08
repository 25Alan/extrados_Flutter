part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  final String? showName;

  const AuthSuccess({this.showName});

  @override
  List<Object> get props => [showName!];
}

class AuthFailure extends AuthState {
  @override
  List<Object> get props => [];
}
