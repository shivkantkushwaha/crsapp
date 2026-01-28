import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/language/language_screen.dart';

void main() {
  runApp(const CRSApp());
}

class CRSApp extends StatelessWidget {
  const CRSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LanguageScreen(),
    );
  }
}
