import 'package:authentication/auth/feature/domain/repository/user_repository.dart';
import 'package:authentication/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class LogOutUseCase{
  final UserRepository userRepository;
  LogOutUseCase({required this.userRepository});
  Future<Either<Failuress,void>>call()async{
    return await userRepository.logOut();
  }
}