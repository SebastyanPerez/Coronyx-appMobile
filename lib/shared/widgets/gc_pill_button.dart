import 'package:material_ui/material_ui.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

/// Botón tipo píldora (primario verde sólido o secundario blanco con borde).
class GcPillButton extends StatelessWidget {
  const GcPillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isPrimary = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isPrimary ? AppColors.green : AppColors.white;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(AppRadii.pill),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        child: Container(
          width: double.infinity,
          height: isPrimary ? 52 : 46,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: isPrimary ? null : Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppRadii.pill),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppTypography.buttonLabel(isPrimary: isPrimary),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
