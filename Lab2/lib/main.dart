import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/product/screens/home_screen.dart';

void main() => runApp(const StreetClothesApp());

class StreetClothesApp extends StatelessWidget {
  const StreetClothesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Street clothes',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const HomeScreen(),
    );
  }
}
