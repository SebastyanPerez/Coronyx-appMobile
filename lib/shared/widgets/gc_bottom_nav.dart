import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class _NavItemData {
  const _NavItemData(this.label, this.iconAsset, this.route);

  final String label;
  final String iconAsset;
  final String route;
}

/// Barra de navegación inferior para el flujo interno del equipo PECOX (GC).
class GcTeamBottomNav extends StatelessWidget {
  const GcTeamBottomNav({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  static const _items = [
    _NavItemData(
      'Biblioteca',
      'assets/icons/icon_book_nav.svg',
      AppRoutes.gc01Center,
    ),
    _NavItemData(
      'Expertos',
      'assets/icons/icon_people.svg',
      AppRoutes.gc04KnowledgeMap,
    ),
    _NavItemData(
      'Aportar',
      'assets/icons/icon_plus.svg',
      AppRoutes.gc03RegisterExperience,
    ),
    _NavItemData(
      'Equipo',
      'assets/icons/icon_shield.svg',
      AppRoutes.gc05UsersPermissions,
    ),
    _NavItemData(
      'Reportes',
      'assets/icons/icon_chart.svg',
      AppRoutes.gc06IndicatorsReports,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _BaseBottomNav(
      items: _items,
      currentIndex: currentIndex,
      onTap: (index) {
        if (onTap != null) {
          onTap!(index);
          return;
        }
        Navigator.of(context).pushReplacementNamed(_items[index].route);
      },
    );
  }
}

/// Barra de navegación inferior para el flujo ciudadano (Página 2 y GC público).
class GcCitizenBottomNav extends StatelessWidget {
  const GcCitizenBottomNav({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  static const _items = [
    _NavItemData(
      'Inicio',
      'assets/icons/icon_nav_home.svg',
      AppRoutes.p09Home,
    ),
    _NavItemData(
      'Mapa',
      'assets/icons/icon_nav_map.svg',
      AppRoutes.p10Map,
    ),
    _NavItemData(
      'Escanear',
      'assets/icons/icon_nav_scan.svg',
      AppRoutes.p12ScanQr,
    ),
    _NavItemData(
      'Premios',
      'assets/icons/icon_nav_rewards.svg',
      AppRoutes.p19Rewards,
    ),
    _NavItemData(
      'Perfil',
      'assets/icons/icon_nav_profile.svg',
      AppRoutes.p26Profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _BaseBottomNav(
      items: _items,
      currentIndex: currentIndex,
      onTap: (index) {
        if (onTap != null) {
          onTap!(index);
          return;
        }
        Navigator.of(context).pushReplacementNamed(_items[index].route);
      },
    );
  }
}

class _BaseBottomNav extends StatelessWidget {
  const _BaseBottomNav({
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<_NavItemData> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lavender,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadii.md),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 80,
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = index == currentIndex;
              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.mint
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(AppRadii.pill),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              item.iconAsset,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.label,
                          style: AppTypography.navLabel.copyWith(
                            color: isSelected
                                ? AppColors.green
                                : AppColors.muted,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
