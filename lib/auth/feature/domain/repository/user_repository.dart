import 'package:authentication/auth/feature/domain/entity/user.dart';
import 'package:authentication/core/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository{
   Future<Either<Failuress,UserEntity>>signUp(UserEntity userentity);
   Future<Either<Failuress,UserEntity>>signIn(String email,String password);
   Future<Either<Failuress,void>>forgotPassword(String email);
   Future<Either<Failuress,bool>>isLoggedIn();
   Future<Either<Failuress,void>>logOut();
   Future<Either<Failuress,UserEntity>>getUser();
}