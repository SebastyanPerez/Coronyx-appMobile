import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../core/theme/app_colors.dart';

enum PecoxStatusTone { active, warning, error, neutral }

/// Pill de estado en vivo con punto indicador para estaciones y cupones.
class PecoxStatusBadge extends StatelessWidget {
  const PecoxStatusBadge({
    super.key,
    required this.label,
    this.tone = PecoxStatusTone.active,
  });

  const PecoxStatusBadge.active(this.label, {super.key})
      : tone = PecoxStatusTone.active;

  const PecoxStatusBadge.warning(this.label, {super.key})
      : tone = PecoxStatusTone.warning;

  const PecoxStatusBadge.error(this.label, {super.key})
      : tone = PecoxStatusTone.error;

  final String label;
  final PecoxStatusTone tone;

  @override
  Widget build(BuildContext context) {
    final (fg, bg) = switch (tone) {
      PecoxStatusTone.active => (AppColors.statusActive, AppColors.statusActiveBg),
      PecoxStatusTone.warning => (AppColors.statusWarning, AppColors.statusWarningBg),
      PecoxStatusTone.error => (AppColors.statusError, AppColors.statusErrorBg),
      PecoxStatusTone.neutral => (AppColors.muted, AppColors.lockedBg),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: fg, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }
}
