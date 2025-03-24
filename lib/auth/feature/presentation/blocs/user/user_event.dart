part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}
class UserSignUpEvent extends UserEvent{
  final UserEntity userEntity;
  UserSignUpEvent({required this.userEntity});
}
class UserSignInEvent extends UserEvent{
  final String email;
  final String password;
  UserSignInEvent({required this.password,required this.email});
}
class UserForgotPasswordEvent extends UserEvent{
  final String email;
  UserForgotPasswordEvent({required this.email});
}
class UserLogOutEvent extends UserEvent{}
class UserIsLoggedInEvent extends UserEvent{}
class UserGetEvent extends UserEvent{}