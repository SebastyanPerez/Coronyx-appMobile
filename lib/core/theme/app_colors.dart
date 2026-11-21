import 'package:material_ui/material_ui.dart';

/// Paleta de colores oficial unificada de PECOX (Página 2 + Módulo GC).
abstract final class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color header = Color(0xFFF8F9FF);
  static const Color soft = Color(0xFFF8F9FF);
  static const Color softAlt = Color(0xFFF8FAFF);
  static const Color lavender = Color(0xFFE6EEFF);
  static const Color border = Color(0xFFD9E3F6);
  static const Color borderSage = Color(0xFFC6D2CA);
  static const Color borderLight = Color(0xFFE0E6E2);
  static const Color mint = Color(0xFFA1F2DE);
  static const Color pointsCard = Color(0xFFDCF7E7);
  static const Color rewardsHero = Color(0xFF98F0B9);
  static const Color thumbBg = Color(0xFFE3ECE5);
  static const Color lockedBg = Color(0xFFF4F5F4);
  static const Color green = Color(0xFF006C49);
  static const Color greenLight = Color(0xFF059669);
  static const Color muted = Color(0xFF3C4A42);
  static const Color grayText = Color(0xFF6B7280);
  static const Color navy = Color(0xFF121C2A);
  static const Color ink = Color(0xFF000000);

  // Estados semánticos
  static const Color statusActive = Color(0xFF16A34A);
  static const Color statusActiveBg = Color(0x1A16A34A);
  static const Color statusWarning = Color(0xFFD97706);
  static const Color statusWarningBg = Color(0x1AD97706);
  static const Color statusError = Color(0xFFDC2626);
  static const Color statusErrorBg = Color(0x1ADC2626);
}

/// Gradientes del sistema de diseño PECOX.
abstract final class AppGradients {
  static const LinearGradient ecoWalletGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.green, AppColors.greenLight],
  );

  static const LinearGradient mintSurfaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.pointsCard, Color(0xFFEFFCF5)],
  );
}

/// Sombras suaves del sistema de diseño PECOX.
abstract final class AppShadows {
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x0F121C2A),
      blurRadius: 16,
      offset: Offset(0, 6),
    ),
  ];

  static const List<BoxShadow> navShadow = [
    BoxShadow(
      color: Color(0x12121C2A),
      blurRadius: 20,
      offset: Offset(0, -4),
    ),
  ];
}

/// Radios de borde consistentes del sistema de diseño PECOX.
abstract final class AppRadii {
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double pill = 999.0;
}
