import '../../../../../core/error/either.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginParams {
  final String? phoneOrEmail;
  final String? confirmCode;

  LoginParams({this.phoneOrEmail, this.confirmCode});
}

class LoginUseCase implements UseCase<UserDataEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserDataEntity>> call(LoginParams params) async {
    return await repository.validateConfirmCode(params.phoneOrEmail ?? '', params.confirmCode ?? '');
  }
}

class SendConfirmCodeParams {
  final String? phoneOrEmail;

  SendConfirmCodeParams({this.phoneOrEmail});
}

class SendConfirmCodeUseCase implements UseCase<void, SendConfirmCodeParams> {
  final AuthRepository repository;

  SendConfirmCodeUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SendConfirmCodeParams params) async {
    return await repository.sendConfirmCode(params.phoneOrEmail ?? '');
  }
}
