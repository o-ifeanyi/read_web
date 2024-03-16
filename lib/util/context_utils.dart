import 'package:flutter/material.dart';

extension XBuildContext<T> on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Color? get textColor => theme.textTheme.bodyMedium?.color;
  Size get screenSize => MediaQuery.sizeOf(this);
  EdgeInsets get edgeInset => MediaQuery.viewPaddingOf(this);
}
