import 'package:flutter/widgets.dart';

class AppTheme {
  static const defaultFontFamily = 'Rawline';

  final ThemeColors colors = ThemeColors();
}

class ThemeColors {
  final BrandColors brand = BrandColors();
  final BackgroundColors background = BackgroundColors();
  final TextColors text = TextColors();
  final ElementsColors elements = ElementsColors();
  final BorderColors border = BorderColors();
}

class BackgroundColors {
  final Color primary = const Color(0xFFFBFBFB);
  final Color blue = const Color(0xFF103875);
  final Color greyLight = const Color(0xFFFBFBFB);
}

class BorderColors {
  final Color blue = const Color(0xFFD0E3FF);
  final Color grey = const Color(0xFFEAEAEA);
}

class TextColors {
  final Color primary = const Color(0xFF313131);
  final Color secondary = const Color(0xFF909090);
}

class ElementsColors {
  final Color white = const Color(0xFFFFFFFF);
  final Color blue = const Color(0xFF1629CF);
  final Color yellow = const Color(0xFFFCB429);
  final Color grey = const Color(0xFF909090);
  final Color paleBlue = const Color(0xFFF6FAFF);
  final Color green = const Color(0xFF02961A);
}

class BrandColors {
  final Color blue = const Color(0xFF003B95);
  final Color peachy = const Color(0xFFFF9500);
  final Color red = const Color(0xFFE11E1E);
}
