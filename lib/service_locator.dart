import 'package:get_it/get_it.dart';

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
