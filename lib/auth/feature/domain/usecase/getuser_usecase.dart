import 'package:authentication/auth/feature/domain/entity/user.dart';
import 'package:authentication/auth/feature/domain/repository/user_repository.dart';
import 'package:authentication/core/failure.dart';
import 'package:fpdart/fpdart.dart';

class GetUserUseCase{
  final UserRepository userRepository;
  GetUserUseCase({required this.userRepository});
  Future<Either<Failuress,UserEntity>>call()async{
    return await userRepository.getUser();
  }
}