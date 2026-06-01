import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vestrollmobile/core/network/dio_client.dart';
import 'package:vestrollmobile/modules/authentication/data/datasources/local_datasources/local_datasource.dart';
import 'package:vestrollmobile/modules/authentication/data/datasources/remote_data_sources/remote_datasource.dart';
import 'package:vestrollmobile/modules/authentication/data/repositories/auth_repositories.dart';
import 'package:vestrollmobile/modules/authentication/domain/domain_repositories/auth_domain_repositories.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // External
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => prefs);
  getIt.registerLazySingleton<Dio>(createDio);

  // Data
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(dio: getIt()),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(prefs: getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  // BLoCs (always factories)
  getIt.registerFactory(() => AuthBloc(authRepository: getIt()));
  getIt.registerFactory(ForgotPasswordBloc.new);
}
