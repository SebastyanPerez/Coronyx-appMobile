import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/gc_bottom_nav.dart';
import '../../../shared/widgets/gc_header.dart';
import '../../../shared/widgets/gc_info_box.dart';
import '../../../shared/widgets/gc_knowledge_card.dart';
import '../../../shared/widgets/gc_pill_button.dart';

/// Pantalla `GC Estado / pendientes` (node 1203:1253) adaptada de Figma.
class PendingReviewsScreen extends StatefulWidget {
  const PendingReviewsScreen({super.key});

  @override
  State<PendingReviewsScreen> createState() => _PendingReviewsScreenState();
}

class _PendingReviewsScreenState extends State<PendingReviewsScreen> {
  int _selectedFilter = 1; // 0 = Biblioteca, 1 = Pendientes (1)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Pendientes de revisión'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REVISIÓN · MANTENIMIENTO',
                    style: AppTypography.pageEyebrow,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Una experiencia por revisar',
                    style: AppTypography.pageTitle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Rosa Huamán · responsable de mantenimiento',
                    style: AppTypography.pageSubtitle,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _FilterChipButton(
                          label: 'Biblioteca',
                          isSelected: _selectedFilter == 0,
                          onTap: () =>
                              Navigator.of(context).pushReplacementNamed(
                            AppRoutes.gc01Center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _FilterChipButton(
                          label: 'Pendientes (1)',
                          isSelected: _selectedFilter == 1,
                          onTap: () => setState(() => _selectedFilter = 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'Experiencia enviada a revisión',
                    body: 'Aún no está publicada en la biblioteca.',
                  ),
                  const SizedBox(height: 12),
                  GcKnowledgeCard(
                    tipo: 'EN REVISIÓN · INC-004',
                    titulo: 'Atasco por una botella con líquido',
                    detalle: 'Javier Salazar · 10 nov 2026',
                    iconAsset: 'assets/icons/icon_book.svg',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStateReviewExperience,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'Antes de aprobar',
                    body: 'Comprueba la causa, la solución y la evidencia.',
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Volver a la biblioteca',
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.gc01Center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcTeamBottomNav(currentIndex: 0),
    );
  }
}

class _FilterChipButton extends StatelessWidget {
  const _FilterChipButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? AppColors.mint : AppColors.white,
      borderRadius: BorderRadius.circular(AppRadii.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.sm),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppRadii.sm),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            label,
            style: AppTypography.filterLabel(isSelected: isSelected),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
