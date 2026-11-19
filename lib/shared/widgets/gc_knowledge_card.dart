import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

/// Tarjeta PECOX para fichas, lecciones, pendientes y responsables.
class GcKnowledgeCard extends StatelessWidget {
  const GcKnowledgeCard({
    super.key,
    required this.tipo,
    required this.titulo,
    required this.detalle,
    this.iconAsset = 'assets/icons/icon_book.svg',
    this.onTap,
  });

  final String tipo;
  final String titulo;
  final String detalle;
  final String iconAsset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppRadii.md),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.md),
        child: Container(
          constraints: const BoxConstraints(minHeight: 112),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppRadii.md),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.mint,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconAsset,
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(tipo, style: AppTypography.cardEyebrow),
                    const SizedBox(height: 4),
                    Text(titulo, style: AppTypography.cardTitle),
                    const SizedBox(height: 4),
                    Text(detalle, style: AppTypography.cardDetail),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
