import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../core/theme/app_colors.dart';

/// Helper centralizado para SnackBars estilizados y BottomSheets redondeados.
abstract final class PecoxFeedback {
  static void showSuccess(BuildContext context, String message) {
    HapticFeedback.mediumImpact();
    _showSnack(
      context,
      message: message,
      icon: Icons.check_circle_rounded,
      iconColor: AppColors.mint,
    );
  }

  static void showError(BuildContext context, String message) {
    HapticFeedback.heavyImpact();
    _showSnack(
      context,
      message: message,
      icon: Icons.error_rounded,
      iconColor: const Color(0xFFFCA5A5),
    );
  }

  static void showInfo(BuildContext context, String message) {
    HapticFeedback.selectionClick();
    _showSnack(
      context,
      message: message,
      icon: Icons.info_rounded,
      iconColor: AppColors.mint,
    );
  }

  static void _showSnack(
    BuildContext context, {
    required String message,
    required IconData icon,
    required Color iconColor,
  }) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  /// Muestra un BottomSheet moderno con bordes superiores redondeados y handle.
  static Future<T?> showSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isScrollControlled = true,
  }) {
    HapticFeedback.lightImpact();
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.borderSage,
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                ),
              ),
              const SizedBox(height: 16),
              builder(ctx),
            ],
          ),
        ),
      ),
    );
  }
}
