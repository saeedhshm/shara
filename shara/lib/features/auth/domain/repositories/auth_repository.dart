import '../../../../../core/error/either.dart';
import '../../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> sendConfirmCode(String phoneOrEmail);
  Future<Either<Failure, UserDataEntity>> validateConfirmCode(String phoneOrEmail, String confirmCode);
  Future<Either<Failure, void>> logout();
}
