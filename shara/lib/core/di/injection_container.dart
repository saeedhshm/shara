import 'package:get/get.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/data/datasources/auth_data_source.dart';
import '../../features/auth/data/datasources/auth_mock_data_source.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';

Future<void> initDependencies() async {
  // Data sources
  Get.lazyPut<AuthDataSource>(() => AuthMockDataSourceImpl());
  // When ready for remote data, use:
  // Get.lazyPut<AuthDataSource>(() => AuthRemoteDataSourceImpl());

  // Repositories
  Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(dataSource: Get.find()));

  // Use Cases
  Get.lazyPut(() => LoginUseCase(Get.find()));
  Get.lazyPut(() => SendConfirmCodeUseCase(Get.find()));
}
