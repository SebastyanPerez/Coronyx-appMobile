import 'package:material_ui/material_ui.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

/// Caja informativa suave (#F8F9FF) con borde #D9E3F6 para avisos y guías.
class GcInfoBox extends StatelessWidget {
  const GcInfoBox({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.soft,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.boxTitle),
          const SizedBox(height: 8),
          Text(body, style: AppTypography.boxBody),
        ],
      ),
    );
  }
}
