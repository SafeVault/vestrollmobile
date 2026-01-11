import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:vestrollmobile/theme_bloc.dart'; // Add this import
import 'package:vestrollmobile/service_locator.dart';

final List<BlocProvider> appBlocProviders = [
  // Theme BLoC
  BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),

  // Authentication BLoCs
  BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
  BlocProvider<ForgotPasswordBloc>(create: (context) => ForgotPasswordBloc()),
];
