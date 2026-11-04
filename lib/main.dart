import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_colors.dart';
import 'presentation/screens/library/library_screen.dart';

void main() {
  runApp(const ProviderScope(child: MagmaApp()));
}

class MagmaApp extends StatelessWidget {
  const MagmaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAGMA',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(primary: AppColors.magmaOrange, surface: AppColors.darkSurface),
        scaffoldBackgroundColor: AppColors.darkBackground,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkBackground),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppColors.magmaOrange),
      ),
      home: const LibraryScreen(),
    );
  }
}
