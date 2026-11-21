import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../core/theme/app_colors.dart';
import 'pecox_surface_card.dart';

/// Tarjeta principal tipo "Billetera Eco" con gradiente esmeralda, contador
/// animado de puntos, barra de progreso hacia la meta y chip de racha semanal.
class PecoxEcoWalletCard extends StatelessWidget {
  const PecoxEcoWalletCard({
    super.key,
    required this.points,
    required this.goalPoints,
    this.rewardLabel = 'próxima recompensa',
    this.streakDays = 0,
    this.onTap,
  });

  final int points;
  final int goalPoints;
  final String rewardLabel;
  final int streakDays;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final remaining = (goalPoints - points).clamp(0, goalPoints);
    final progress = goalPoints > 0 ? (points / goalPoints).clamp(0.0, 1.0) : 0.0;

    return PecoxSurfaceCard(
      onTap: onTap,
      gradient: AppGradients.ecoWalletGradient,
      borderColor: null,
      borderRadius: AppRadii.xl,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'BILLETERA ECO',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                  color: AppColors.mint,
                ),
              ),
              const Spacer(),
              if (streakDays > 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(AppRadii.pill),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.local_fire_department_rounded,
                        size: 14,
                        color: AppColors.mint,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Racha $streakDays d',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              TweenAnimationBuilder<int>(
                tween: IntTween(begin: 0, end: points),
                duration: const Duration(milliseconds: 650),
                curve: Curves.easeOutCubic,
                builder: (context, value, _) {
                  return Text(
                    '$value',
                    style: GoogleFonts.montserrat(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      height: 1.0,
                    ),
                  );
                },
              ),
              const SizedBox(width: 6),
              Text(
                'pts',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mint,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.pill),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: progress),
              duration: const Duration(milliseconds: 650),
              curve: Curves.easeOutCubic,
              builder: (context, value, _) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 8,
                  backgroundColor: AppColors.white.withValues(alpha: 0.22),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.mint,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  remaining > 0
                      ? 'Te faltan $remaining pts para tu $rewardLabel'
                      : '¡Ya puedes canjear tu $rewardLabel!',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white.withValues(alpha: 0.92),
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 13,
                color: AppColors.mint,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
