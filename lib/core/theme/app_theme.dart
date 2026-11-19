import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Configuración de tema global para PECOX GC.
abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: const ColorScheme.light(
          primary: AppColors.green,
          secondary: AppColors.mint,
          surface: AppColors.white,
          onPrimary: AppColors.white,
          onSecondary: AppColors.green,
          onSurface: AppColors.ink,
          outline: AppColors.border,
        ),
        fontFamily: GoogleFonts.inter().fontFamily,
      );
}
