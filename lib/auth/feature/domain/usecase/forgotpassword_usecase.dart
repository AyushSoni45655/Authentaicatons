import 'package:authentication/auth/feature/domain/repository/user_repository.dart';
import 'package:authentication/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class ForgotPasswordUseCase{
  final UserRepository userRepository;
  ForgotPasswordUseCase({required this.userRepository});
  Future<Either<Failuress,void>>call(String email)async{
    return await userRepository.forgotPassword(email);
  }
}