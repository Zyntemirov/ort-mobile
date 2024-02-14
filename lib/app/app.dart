import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ort_mobile/app/routes/app_routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  GoRouter? _goRouter;

  @override
  void initState() {
    _initGoRouterInstance();
    super.initState();
  }

  void _initGoRouterInstance() {
    _goRouter = AppRoutes.getGoRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _goRouter!,
    );
  }
}
