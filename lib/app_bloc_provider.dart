import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/auth_bloc.dart';
import 'package:vestrollmobile/service_locator.dart';

final List<BlocProvider> appBlocProviders = [
  // Authentication BLoCs
  BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
];
