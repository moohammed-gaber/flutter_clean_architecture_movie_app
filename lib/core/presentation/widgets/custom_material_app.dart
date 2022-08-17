import 'package:clean_arch_movie_app/core/presentation/app_routes.dart';
import 'package:clean_arch_movie_app/core/presentation/app_theme.dart';
import 'package:flutter/material.dart';

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (_, widgets) => SafeArea(child: widgets!),
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      routes: AppRoutes.routes,
    );
  }
}
