import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/app_bloc_provider.dart';
import 'package:vestrollmobile/core/navigation/app_router.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_theme.dart';
import 'package:vestrollmobile/shared/widgets/dismiss_keyboard.dart';
import 'package:vestrollmobile/theme_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  void _updateSystemUIOverlay(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      child: MultiBlocProvider(
        providers: appBlocProviders,
        child: DismissKeyboard(
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              _updateSystemUIOverlay(themeState.isDarkMode);

              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'VestrollMobile',
                theme: AppTheme.light,
                darkTheme: AppTheme.light,
                themeMode:
                    themeState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                scrollBehavior: const _AppScrollBehavior(),
                routeInformationProvider:
                    AppRouter.router.routeInformationProvider,
                routeInformationParser: AppRouter.router.routeInformationParser,
                routerDelegate: AppRouter.router.routerDelegate,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AppScrollBehavior extends ScrollBehavior {
  const _AppScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
