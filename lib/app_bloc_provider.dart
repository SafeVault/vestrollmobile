import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:vestrollmobile/service_locator.dart';
import 'package:vestrollmobile/theme_bloc.dart';

final List<BlocProvider> appBlocProviders = [
  BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
  BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>()),
  BlocProvider<ForgotPasswordBloc>(create: (_) => getIt<ForgotPasswordBloc>()),
];
