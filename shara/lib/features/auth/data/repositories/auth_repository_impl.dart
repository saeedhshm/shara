import '../../../../core/error/either.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> sendConfirmCode(String phoneOrEmail) async {
    try {
      await dataSource.sendConfirmCode(phoneOrEmail);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserDataEntity>> validateConfirmCode(String? phoneOrEmail, String confirmCode) async {
    try {
      final userDataModel = await dataSource.validateConfirmCode(phoneOrEmail ?? '', confirmCode);
      return Right(userDataModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await dataSource.logout();
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
