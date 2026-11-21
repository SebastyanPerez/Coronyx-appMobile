import 'package:flutter/services.dart';
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

class _CitizenNavItemData {
  const _CitizenNavItemData(this.label, this.icon, this.route);

  final String label;
  final IconData icon;
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
    _CitizenNavItemData('Inicio', Icons.home_rounded, AppRoutes.p09Home),
    _CitizenNavItemData('Mapa', Icons.map_rounded, AppRoutes.p10Map),
    _CitizenNavItemData(
      'Escanear',
      Icons.qr_code_scanner_rounded,
      AppRoutes.p12ScanQr,
    ),
    _CitizenNavItemData(
      'Premios',
      Icons.card_giftcard_rounded,
      AppRoutes.p19Rewards,
    ),
    _CitizenNavItemData('Perfil', Icons.person_rounded, AppRoutes.p26Profile),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadii.xl),
        ),
        boxShadow: AppShadows.navShadow,
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 76,
          child: Row(
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final isSelected = index == currentIndex;
              final isCenterScan = index == 2;

              void handleTap() {
                HapticFeedback.lightImpact();
                if (onTap != null) {
                  onTap!(index);
                  return;
                }
                if (isSelected) return;
                Navigator.of(context).pushReplacementNamed(item.route);
              }

              if (isCenterScan) {
                return Expanded(
                  child: InkWell(
                    onTap: handleTap,
                    borderRadius: BorderRadius.circular(AppRadii.lg),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: AppGradients.ecoWalletGradient,
                            borderRadius: BorderRadius.circular(AppRadii.pill),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x33006C49),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            item.icon,
                            size: 22,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.label,
                          style: AppTypography.navLabel.copyWith(
                            color: isSelected
                                ? AppColors.green
                                : AppColors.navy,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Expanded(
                child: InkWell(
                  onTap: handleTap,
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 44,
                        height: 30,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.pointsCard
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(AppRadii.pill),
                        ),
                        child: Icon(
                          item.icon,
                          size: 21,
                          color: isSelected
                              ? AppColors.green
                              : AppColors.grayText,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: AppTypography.navLabel.copyWith(
                          color: isSelected
                              ? AppColors.green
                              : AppColors.grayText,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
