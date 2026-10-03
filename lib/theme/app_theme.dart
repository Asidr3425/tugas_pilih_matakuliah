import 'package:flutter/material.dart';

/// Warna dari DESIGN.md (bagian Colors & Components).
abstract final class KurasiColors {
  static const canvas = Color(0xFFFBF9F5);
  static const tray = Color(0xFFFAF7F2);
  static const surface1 = Color(0xFFF3EFEA);
  static const surface2 = Color(0xFFEAE3DB);
  static const outline = Color(0xFFDFD8CE);
  static const ink = Color(0xFF23201C);
  static const inkSoft = Color(0xFF414845);
  static const sage = Color(0xFF3E5C52);
  static const sageTint = Color(0xFFEEF3F0);
}

const _displayFont = 'Epilogue';
const _bodyFont = 'PlusJakartaSans';

TextStyle _style(
  String family,
  double size,
  double line,
  FontWeight weight, [
  double tracking = 0,
]) {
  return TextStyle(
    fontFamily: family,
    fontSize: size,
    height: line / size,
    fontWeight: weight,
    letterSpacing: size * tracking,
    color: KurasiColors.ink,
  );
}

/// Tombol sekunder (tanpa border): dipakai untuk "Ambil" dan "Batal Ambil".
final ButtonStyle secondaryButtonStyle = FilledButton.styleFrom(
  backgroundColor: KurasiColors.surface2,
  foregroundColor: KurasiColors.ink,
);

ThemeData buildTheme() {
  final label = _style(_bodyFont, 13, 18, FontWeight.w600, 0.01);
  final textTheme = TextTheme(
    headlineMedium: _style(_displayFont, 22, 28, FontWeight.w600, -0.015),
    headlineSmall: _style(_displayFont, 18, 24, FontWeight.w600, -0.01),
    titleMedium: _style(_bodyFont, 16, 22, FontWeight.w600, -0.005),
    bodyLarge: _style(_bodyFont, 15, 22, FontWeight.w400),
    bodyMedium: _style(_bodyFont, 14, 20, FontWeight.w400),
    bodySmall: _style(_bodyFont, 12, 17, FontWeight.w400),
    labelLarge: label,
    labelMedium: label,
    labelSmall: _style(_bodyFont, 11, 15, FontWeight.w600, 0.02),
  );

  return ThemeData(
    useMaterial3: true,
    fontFamily: _bodyFont,
    colorScheme: const ColorScheme.light(
      primary: KurasiColors.sage,
      onPrimary: KurasiColors.canvas,
      surface: KurasiColors.canvas,
      onSurface: KurasiColors.ink,
      outline: KurasiColors.outline,
      surfaceTint: Colors.transparent,
    ),
    scaffoldBackgroundColor: KurasiColors.canvas,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: KurasiColors.canvas,
      foregroundColor: KurasiColors.ink,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: textTheme.headlineMedium,
    ),
    cardTheme: CardThemeData(
      color: KurasiColors.surface1,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      titleTextStyle: textTheme.titleMedium,
      subtitleTextStyle: textTheme.bodyMedium?.copyWith(
        color: KurasiColors.inkSoft,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: KurasiColors.sage,
        foregroundColor: KurasiColors.canvas,
        disabledBackgroundColor: const Color(0xFFECE7E0),
        disabledForegroundColor: const Color(0xFFA49C92),
        minimumSize: const Size(0, 48),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: textTheme.labelLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: KurasiColors.sage,
        textStyle: textTheme.labelLarge,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: KurasiColors.tray,
      surfaceTintColor: Colors.transparent,
      showDragHandle: true,
      dragHandleColor: KurasiColors.outline,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: KurasiColors.tray,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titleTextStyle: textTheme.headlineSmall,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: KurasiColors.ink,
      contentTextStyle: textTheme.bodyMedium?.copyWith(
        color: KurasiColors.canvas,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
