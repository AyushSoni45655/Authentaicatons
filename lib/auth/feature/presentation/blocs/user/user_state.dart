part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
final class UserLoading extends UserState{}
final class UserLoggedIn extends UserState{}
final class UserLogOut extends UserState{}
final class UserFetchUserData extends UserState{
  final UserEntity userEntity;
  UserFetchUserData({required this.userEntity});
}
final class UserSuccess extends UserState{
  final UserEntity userEntity;
  UserSuccess({required this.userEntity});
}
final class UserError extends UserState{
  final String error;
  UserError({required this.error});
}