import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import '../../core/theme/app_colors.dart';

/// Tarjeta base del sistema de diseño PECOX con elevación suave, borde sutil
/// y soporte opcional de gradiente e interacción háptica.
class PecoxSurfaceCard extends StatelessWidget {
  const PecoxSurfaceCard({
    super.key,
    required this.child,
    this.onTap,
    this.gradient,
    this.backgroundColor = AppColors.white,
    this.borderColor = AppColors.borderLight,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = AppRadii.lg,
    this.boxShadow = AppShadows.cardShadow,
  });

  final Widget child;
  final VoidCallback? onTap;
  final Gradient? gradient;
  final Color backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);

    return Container(
      decoration: BoxDecoration(
        color: gradient == null ? backgroundColor : null,
        gradient: gradient,
        borderRadius: radius,
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        boxShadow: boxShadow,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          onTap: onTap == null
              ? null
              : () {
                  HapticFeedback.lightImpact();
                  onTap!();
                },
          borderRadius: radius,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
