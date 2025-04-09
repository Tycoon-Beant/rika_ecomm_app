import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/di/service_locator.dart';
import 'package:rika_ecomm_app/routes/app_router.dart';

import 'package:rika_ecomm_app/theme/app_theme.dart';
import 'package:rika_ecomm_app/theme/cubit/theme_cubit.dart';

import 'config/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalBlocObserver();
  await setupServiceLocator();

  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            builder: (context, child) {
              final mediaQueryData = MediaQuery.of(context);
              return MediaQuery(
                data: mediaQueryData.copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
            theme: AppTheme().lightTheme,
            darkTheme: AppTheme().darkTheme,
            themeMode: state,
            routes: routes.routes,
            navigatorKey: rootNavigator,
          );
        },
      ),
    );
  }
}
