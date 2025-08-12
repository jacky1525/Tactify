import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0D47A1); // Lacivert/koyu mavi
  static const Color accent = Color(0xFF1976D2);  // Mavi ton
  static const Color background = Color(0xFF121212); // Koyu zemin
  static const Color card = Color(0xFF1E1E1E); // Kart arka planı
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.grey;
  static const Color border = Color(0xFF2C2C2C);
  static const Color highlight = Color(0xFF42A5F5); // Buton / vurgulu alanlar
}

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  cardColor: AppColors.card,
  hintColor: AppColors.textSecondary,
  dividerColor: AppColors.border,
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),
    titleLarge: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 18),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.card,
    foregroundColor: AppColors.textPrimary,
    elevation: 0,
    centerTitle: true,
  ),
  iconTheme: const IconThemeData(color: AppColors.textSecondary),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: AppColors.card,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.border),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.accent),
    ),
    hintStyle: TextStyle(color: AppColors.textSecondary),
  ),
);
