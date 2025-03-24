import 'package:authentication/auth/feature/domain/repository/user_repository.dart';
import 'package:authentication/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class LoggedInUseCase{
  final UserRepository userRepository;
  LoggedInUseCase({required this.userRepository});
  Future<Either<Failuress,bool>>call()async{
    return await userRepository.isLoggedIn();
  }
}