import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, // Begin inmediatly (not lazy load)
            create: (_) => AuthProvider())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: Flurorouter.router.generator,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return SplashLayout();
        }
        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      // For color of scrollbar, we have to change all theme scrollbar theme.
      theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData(
              thumbColor:
                  MaterialStateProperty.all(Colors.grey.withOpacity(0.5)))),
    );
  }
}
