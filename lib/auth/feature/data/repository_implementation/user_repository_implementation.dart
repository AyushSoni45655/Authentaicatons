import 'package:authentication/auth/feature/data/data_source/user_datasource.dart';
import 'package:authentication/auth/feature/domain/entity/user.dart';
import 'package:authentication/auth/feature/domain/repository/user_repository.dart';
import 'package:authentication/core/failure.dart';
import 'package:fpdart/src/either.dart';

class UserRepositoryImplementation extends UserRepository{
  final UserDataSource userDataSource;
  UserRepositoryImplementation({required this.userDataSource});
  @override
  Future<Either<Failuress, void>> forgotPassword(String email)async{
   try{
     final fpassword = await userDataSource.forgotPassword(email);
     return Right(fpassword);
   }catch(e){
     return Left(ServerFailure(e.toString()));
   }
  }

  @override
  Future<Either<Failuress, bool>> isLoggedIn()async{
    try{
      final loggedin = await userDataSource.isUserLoggedIn();
      return Right(loggedin);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, void>> logOut()async{
    try{
      final logout = await userDataSource.logOut();
      return Right(logout);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, UserEntity>> signIn(String email, String password)async{
    try{
      final signin = await userDataSource.signin(email, password);
      return Right(signin);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, UserEntity>> signUp(UserEntity userentity)async{
    try{
      final signup = await userDataSource.signUp(userentity);
      return Right(signup);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, UserEntity>> getUser()async{
   try{
     final user = await userDataSource.getUser();
     return Right(user);
   }catch(e){
     return Left(ServerFailure(e.toString()));
   }
  }

}