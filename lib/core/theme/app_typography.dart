import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Estilos tipográficos de PECOX GC (Montserrat para títulos, Inter para cuerpo).
abstract final class AppTypography {
  static TextStyle get headerTitle => GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 25 / 18,
        color: AppColors.green,
      );

  static TextStyle get pageEyebrow => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 1.42,
        color: AppColors.green,
      );

  static TextStyle get pageTitle => GoogleFonts.montserrat(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.45,
        color: AppColors.ink,
      );

  static TextStyle get pageSubtitle => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.42,
        color: AppColors.muted,
      );

  static TextStyle get cardEyebrow => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        height: 14 / 10,
        color: AppColors.green,
      );

  static TextStyle get cardTitle => GoogleFonts.montserrat(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.45,
        color: AppColors.ink,
      );

  static TextStyle get cardDetail => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 17 / 12,
        color: AppColors.muted,
      );

  static TextStyle get boxTitle => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.45,
        color: AppColors.green,
      );

  static TextStyle get boxBody => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.42,
        color: AppColors.muted,
      );

  static TextStyle filterLabel({required bool isSelected}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.42,
        color: isSelected ? AppColors.green : AppColors.muted,
      );

  static TextStyle buttonLabel({required bool isPrimary}) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.42,
        color: isPrimary ? AppColors.white : AppColors.green,
      );

  static TextStyle get navLabel => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        height: 1.42,
        color: AppColors.muted,
      );
}
