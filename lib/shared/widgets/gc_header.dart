import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

/// Encabezado superior estándar de las pantallas PECOX GC.
class GcHeader extends StatelessWidget {
  const GcHeader({
    super.key,
    required this.title,
    this.onBack,
    this.showCatalogButton = true,
  });

  final String title;
  final VoidCallback? onBack;
  final bool showCatalogButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.header,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  if (onBack != null) {
                    onBack!();
                  } else if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pushReplacementNamed(
                      AppRoutes.p09Home,
                    );
                  }
                },
                borderRadius: BorderRadius.circular(AppRadii.sm),
                child: SizedBox(
                  width: 36,
                  height: 40,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/icon_back.svg',
                      width: 22,
                      height: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.headerTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (kDebugMode && showCatalogButton)
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRoutes.catalog,
                  ),
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mint,
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                    ),
                    child: Text(
                      '52 vistas',
                      style: AppTypography.cardEyebrow,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
