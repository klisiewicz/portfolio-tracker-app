import 'package:flutter/material.dart';
import 'package:portfolio_tracker_app/src/l10n/localization.dart';
import 'package:portfolio_tracker_app/src/l10n/localization_en.dart';

extension BuildContextThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension LocalizationExt on BuildContext {
  Localization get text => Localization.of(this) ?? LocalizationEn();
}

extension MediaQueryExt on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;
}
