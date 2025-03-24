import 'package:authentication/auth/feature/domain/entity/user.dart';
import 'package:authentication/auth/feature/domain/repository/user_repository.dart';
import 'package:authentication/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class SignInUseCase{
  final UserRepository userRepository;
  SignInUseCase({required this.userRepository});
  Future<Either<Failuress,UserEntity>>call(String email,String password)async{
    return await userRepository.signIn(email, password);
  }
}