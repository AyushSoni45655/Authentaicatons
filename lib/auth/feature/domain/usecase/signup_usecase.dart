import 'package:authentication/auth/feature/domain/entity/user.dart';
import 'package:authentication/auth/feature/domain/repository/user_repository.dart';
import 'package:authentication/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class SignUpUseCase {
  final UserRepository userRepository;
  SignUpUseCase({required this.userRepository});
  Future<Either<Failuress,UserEntity>>call(UserEntity user)async{
    return await userRepository.signUp(user);
  }
}