import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

/// Botón tipo píldora (primario verde sólido o secundario blanco con borde)
/// con efecto de escala táctil y respuesta háptica.
class GcPillButton extends StatefulWidget {
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
  State<GcPillButton> createState() => _GcPillButtonState();
}

class _GcPillButtonState extends State<GcPillButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.isPrimary ? AppColors.green : AppColors.white;

    return AnimatedScale(
      scale: _pressed ? 0.97 : 1.0,
      duration: const Duration(milliseconds: 110),
      curve: Curves.easeOut,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        child: InkWell(
          onTap: widget.onPressed == null
              ? null
              : () {
                  HapticFeedback.lightImpact();
                  widget.onPressed!();
                },
          onHighlightChanged: (value) {
            if (_pressed != value) setState(() => _pressed = value);
          },
          borderRadius: BorderRadius.circular(AppRadii.pill),
          child: Container(
            width: double.infinity,
            height: widget.isPrimary ? 52 : 46,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: widget.isPrimary
                  ? null
                  : Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(AppRadii.pill),
            ),
            alignment: Alignment.center,
            child: Text(
              widget.label,
              style: AppTypography.buttonLabel(isPrimary: widget.isPrimary),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
