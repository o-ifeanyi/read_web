import 'package:flutter/material.dart';

class Config {
  static TextTheme get textTheme => const TextTheme(
        displayLarge: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        displayMedium: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        titleLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        titleMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        titleSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.4,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.4,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          height: 1.4,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          height: 1.4,
        ),
        labelSmall: TextStyle(fontSize: 10),
      );

  static Widget get hGap5 => const SizedBox(width: 5);
  static Widget get hGap10 => const SizedBox(width: 10);
  static Widget get hGap15 => const SizedBox(width: 15);
  static Widget get hGap20 => const SizedBox(width: 20);
  static Widget get hGap30 => const SizedBox(width: 30);

  static Widget get vGap5 => const SizedBox(height: 5);
  static Widget get vGap10 => const SizedBox(height: 10);
  static Widget get vGap15 => const SizedBox(height: 15);
  static Widget get vGap20 => const SizedBox(height: 20);
  static Widget get vGap30 => const SizedBox(height: 30);
  static Widget get vGap60 => const SizedBox(height: 60);
}
