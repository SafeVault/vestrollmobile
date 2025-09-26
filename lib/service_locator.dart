import 'package:get_it/get_it.dart';
import 'package:vestrollmobile/modules/authentication/domain/domain_repositories/auth_domain_repositories.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Repositories
  // getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // // Use Cases
  // getIt.registerLazySingleton(() => LoginUseCase(getIt()));

  // // BLoCs
  // getIt.registerFactory(
  //   () => AuthBloc(loginUseCase: getIt(), logoutUseCase: getIt()),
  // );
}
