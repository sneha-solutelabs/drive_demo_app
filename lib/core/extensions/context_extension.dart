import 'package:drive_poc/core/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deriv_theme/theme_provider.dart';

/// Extension methods for [BuildContext].
extension ContextExtension on BuildContext {
  /// Gets [ThemeProvider].
  ThemeProvider get theme => AppThemeProvider.of(this);

  /// Gets the device's screen size.
  Size get screenSize => MediaQuery.of(this).size;
}