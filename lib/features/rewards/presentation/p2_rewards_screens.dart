import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/gc_bottom_nav.dart';
import '../../../shared/widgets/gc_pill_button.dart';
import '../../../shared/widgets/p2_common_widgets.dart';
import '../../../shared/widgets/pecox_empty_state.dart';
import '../../../shared/widgets/pecox_feedback.dart';
import '../../../shared/widgets/pecox_status_badge.dart';
import '../../../shared/widgets/pecox_surface_card.dart';

class _RewardItem {
  const _RewardItem({
    required this.id,
    required this.title,
    required this.category,
    required this.cost,
    required this.icon,
    this.isLocked = false,
  });

  final String id;
  final String title;
  final String category;
  final int cost;
  final IconData icon;
  final bool isLocked;
}

const _rewardsCatalog = [
  _RewardItem(
    id: 'detergente',
    title: 'Detergente Multiusos',
    category: 'Limpieza',
    cost: 80,
    icon: Icons.cleaning_services_rounded,
  ),
  _RewardItem(
    id: 'arroz',
    title: 'Pack de arroz y menestras',
    category: 'Abarrotes',
    cost: 150,
    icon: Icons.shopping_basket_rounded,
  ),
  _RewardItem(
    id: 'canasta',
    title: 'Canasta básica familiar',
    category: 'Abarrotes',
    cost: 500,
    icon: Icons.inventory_2_rounded,
    isLocked: true,
  ),
  _RewardItem(
    id: 'aceite',
    title: 'Aceite de cocina 1L',
    category: 'Abarrotes',
    cost: 120,
    icon: Icons.local_grocery_store_rounded,
  ),
];

void _showInsufficientBalanceSheet(BuildContext context, int missingPoints) {
  PecoxFeedback.showSheet<void>(
    context: context,
    builder: (ctx) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: AppColors.statusWarningBg,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.lock_outline_rounded,
            size: 30,
            color: AppColors.statusWarning,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Aún te faltan $missingPoints pts',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.navy,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Deposita botellas PET de 500 ml en la estación El Porvenir para alcanzar esta recompensa.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontSize: 13, color: AppColors.muted),
        ),
        const SizedBox(height: 22),
        GcPillButton(
          label: 'Buscar estación cercana',
          isPrimary: true,
          onPressed: () {
            Navigator.of(ctx).pop();
            Navigator.of(context).pushReplacementNamed(AppRoutes.p10Map);
          },
        ),
        const SizedBox(height: 10),
        GcPillButton(
          label: 'Seguir viendo premios',
          onPressed: () => Navigator.of(ctx).pop(),
        ),
      ],
    ),
  );
}

void _showConfirmRedeemSheet(BuildContext context) {
  PecoxFeedback.showSheet<void>(
    context: context,
    builder: (ctx) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: AppColors.pointsCard,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.card_giftcard_rounded,
            size: 30,
            color: AppColors.green,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          '¿Confirmas el canje?',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.navy,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Canjearás Detergente Multiusos por 80 puntos. Tu nuevo saldo será de 120 puntos.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontSize: 13, color: AppColors.muted),
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            Expanded(
              child: GcPillButton(
                label: 'Cancelar',
                onPressed: () => Navigator.of(ctx).pop(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GcPillButton(
                label: 'Confirmar',
                isPrimary: true,
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(context).pushNamed(AppRoutes.p22ProcessingRedeem);
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

/// 19 Recompensas mejoradas (888:592)
class P19RewardsScreen extends StatefulWidget {
  const P19RewardsScreen({super.key});

  @override
  State<P19RewardsScreen> createState() => _P19RewardsScreenState();
}

class _P19RewardsScreenState extends State<P19RewardsScreen> {
  int _filterIndex = 0;

  static const _categories = ['Todos', 'Abarrotes', 'Limpieza', 'Otros'];

  List<_RewardItem> get _filteredRewards {
    if (_filterIndex == 0) return _rewardsCatalog;
    final selected = _categories[_filterIndex];
    return _rewardsCatalog.where((r) => r.category == selected).toList();
  }

  @override
  Widget build(BuildContext context) {
    final items = _filteredRewards;

    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          P2Header(
            title: 'Recompensas',
            trailing: InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                AppRoutes.p25MyRedemptions,
              ),
              borderRadius: BorderRadius.circular(AppRadii.pill),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.pointsCard,
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.confirmation_number_rounded,
                      size: 14,
                      color: AppColors.green,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Mis canjes',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PecoxSurfaceCard(
                    gradient: AppGradients.ecoWalletGradient,
                    borderColor: null,
                    borderRadius: AppRadii.xl,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PUNTOS DISPONIBLES',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.7,
                                  color: AppColors.mint,
                                ),
                              ),
                              const SizedBox(height: 6),
                              TweenAnimationBuilder<int>(
                                tween: IntTween(begin: 0, end: 200),
                                duration: const Duration(milliseconds: 550),
                                builder: (context, value, _) {
                                  return Text(
                                    '$value pts',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: AppColors.white.withValues(alpha: 0.16),
                            borderRadius: BorderRadius.circular(AppRadii.lg),
                          ),
                          child: const Icon(
                            Icons.card_giftcard_rounded,
                            color: AppColors.mint,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  P2FilterChips(
                    labels: _categories,
                    selectedIndex: _filterIndex,
                    onSelected: (i) {
                      HapticFeedback.selectionClick();
                      setState(() => _filterIndex = i);
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'PREMIOS DISPONIBLES',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (items.isEmpty)
                    PecoxEmptyState(
                      icon: Icons.card_giftcard_rounded,
                      title: 'Sin premios en esta categoría',
                      subtitle:
                          'Pronto agregaremos más beneficios en ${_categories[_filterIndex]}.',
                      actionLabel: 'Ver todos los premios',
                      onAction: () => setState(() => _filterIndex = 0),
                    )
                  else
                    ...List.generate(items.length, (index) {
                      final item = items[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index == items.length - 1 ? 0 : 10,
                        ),
                        child: _RewardItemCard(
                          item: item,
                          onTap: () {
                            if (item.isLocked) {
                              _showInsufficientBalanceSheet(
                                context,
                                (item.cost - 200).clamp(0, item.cost),
                              );
                            } else {
                              Navigator.of(context).pushNamed(
                                AppRoutes.p20RewardDetail,
                              );
                            }
                          },
                        ),
                      );
                    }),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 3),
    );
  }
}

class _RewardItemCard extends StatelessWidget {
  const _RewardItemCard({
    required this.item,
    required this.onTap,
  });

  final _RewardItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isLocked = item.isLocked;
    return PecoxSurfaceCard(
      onTap: onTap,
      backgroundColor: isLocked ? AppColors.lockedBg : AppColors.white,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Hero(
            tag: 'reward-hero-${item.id}',
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: isLocked ? const Color(0xFFE5E7EB) : AppColors.pointsCard,
                borderRadius: BorderRadius.circular(AppRadii.md),
              ),
              child: Icon(
                item.icon,
                size: 28,
                color: isLocked ? AppColors.grayText : AppColors.green,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isLocked ? AppColors.grayText : AppColors.navy,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isLocked
                      ? '${item.cost} pts · Te faltan ${item.cost - 200} pts'
                      : '${item.cost} pts · ${item.category}',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.grayText,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isLocked ? AppColors.white : AppColors.green,
              border: isLocked ? Border.all(color: AppColors.borderSage) : null,
              borderRadius: BorderRadius.circular(AppRadii.pill),
            ),
            child: Text(
              isLocked ? 'Bloqueado' : 'Canjear',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isLocked ? AppColors.grayText : AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 20 Detalle del premio (888:653)
class P20RewardDetailScreen extends StatelessWidget {
  const P20RewardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Detalle del premio'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                children: [
                  Hero(
                    tag: 'reward-hero-detergente',
                    child: PecoxSurfaceCard(
                      gradient: AppGradients.mintSurfaceGradient,
                      borderColor: AppColors.borderSage,
                      borderRadius: AppRadii.xl,
                      padding: const EdgeInsets.symmetric(vertical: 42),
                      child: const Center(
                        child: Icon(
                          Icons.cleaning_services_rounded,
                          size: 72,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const PecoxStatusBadge.active('Disponible para canje'),
                  const SizedBox(height: 12),
                  Text(
                    'Detergente Multiusos',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Producto de limpieza de 1 litro. Canje válido en bodegas y establecimientos afiliados de El Porvenir.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      height: 1.45,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 22),
                  PecoxSurfaceCard(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Costo del canje',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: AppColors.muted,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '80 pts',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 36,
                          color: AppColors.borderLight,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Saldo después',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: AppColors.muted,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '120 pts',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.navy,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  GcPillButton(
                    label: 'Canjear premio',
                    isPrimary: true,
                    onPressed: () => _showConfirmRedeemSheet(context),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Ver condiciones',
                    onPressed: () => PecoxFeedback.showInfo(
                      context,
                      'Válido presentando el código en tienda afiliada.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 21 Confirmar canje (888:671)
class P21ConfirmRedeemScreen extends StatelessWidget {
  const P21ConfirmRedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PecoxSurfaceCard(
              borderRadius: AppRadii.xl,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: AppColors.pointsCard,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.card_giftcard_rounded,
                      size: 30,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '¿Confirmas el canje?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Canjearás Detergente Multiusos por 80 puntos. Tu saldo final será de 120 puntos.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: GcPillButton(
                          label: 'Cancelar',
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: GcPillButton(
                          label: 'Confirmar',
                          isPrimary: true,
                          onPressed: () => Navigator.of(context).pushNamed(
                            AppRoutes.p22ProcessingRedeem,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 22 Procesando canje (888:682)
class P22ProcessingRedeemScreen extends StatefulWidget {
  const P22ProcessingRedeemScreen({super.key});

  @override
  State<P22ProcessingRedeemScreen> createState() =>
      _P22ProcessingRedeemScreenState();
}

class _P22ProcessingRedeemScreenState extends State<P22ProcessingRedeemScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1300), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.p23RedeemSuccess);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Center(
            child: PecoxSurfaceCard(
              borderRadius: AppRadii.xl,
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      color: AppColors.pointsCard,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(18),
                    child: const CircularProgressIndicator(
                      strokeWidth: 3.5,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'Procesando tu canje',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Reservando Detergente Multiusos (80 pts) y generando tu comprobante...',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 23 Canje realizado (888:689)
class P23RedeemSuccessScreen extends StatefulWidget {
  const P23RedeemSuccessScreen({super.key});

  @override
  State<P23RedeemSuccessScreen> createState() => _P23RedeemSuccessScreenState();
}

class _P23RedeemSuccessScreenState extends State<P23RedeemSuccessScreen> {
  @override
  void initState() {
    super.initState();
    HapticFeedback.mediumImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  gradient: AppGradients.ecoWalletGradient,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 44,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                '¡Canje realizado!',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Detergente Multiusos',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 22),
              PecoxSurfaceCard(
                gradient: AppGradients.mintSurfaceGradient,
                borderColor: AppColors.borderSage,
                borderRadius: AppRadii.xl,
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    Text(
                      'CÓDIGO DE CANJE',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.7,
                        color: AppColors.muted,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Icon(
                      Icons.qr_code_2_rounded,
                      size: 88,
                      color: AppColors.navy,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'PCX-8042',
                      style: GoogleFonts.montserrat(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const PecoxStatusBadge.active('Válido hasta el 30/07/2026'),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Nuevo saldo: 120 pts',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 24),
              GcPillButton(
                label: 'Ver mis canjes',
                isPrimary: true,
                onPressed: () => Navigator.of(context).pushReplacementNamed(
                  AppRoutes.p25MyRedemptions,
                ),
              ),
              const SizedBox(height: 12),
              GcPillButton(
                label: 'Volver a recompensas',
                onPressed: () => Navigator.of(context).pushReplacementNamed(
                  AppRoutes.p19Rewards,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 24 Saldo insuficiente (888:703)
class P24InsufficientBalanceScreen extends StatelessWidget {
  const P24InsufficientBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PecoxSurfaceCard(
              borderRadius: AppRadii.xl,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: AppColors.statusWarningBg,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.lock_outline_rounded,
                      size: 30,
                      color: AppColors.statusWarning,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Aún no tienes puntos suficientes',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Te faltan 300 puntos para canjear la Canasta básica familiar. Sigue reciclando botellas PET para alcanzar la meta.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GcPillButton(
                    label: 'Buscar punto cercano',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.p10Map,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Volver a premios',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RedemptionData {
  const _RedemptionData({
    required this.title,
    required this.code,
    required this.points,
    required this.dateText,
    required this.tabIndex,
  });

  final String title;
  final String code;
  final int points;
  final String dateText;
  final int tabIndex;
}

const _redemptions = [
  _RedemptionData(
    title: 'Detergente Multiusos',
    code: 'PCX-8042',
    points: 80,
    dateText: 'Disponible hasta 30/07/2026',
    tabIndex: 0,
  ),
  _RedemptionData(
    title: 'Aceite de cocina 1L',
    code: 'PCX-1108',
    points: 120,
    dateText: 'Utilizado el 02/07/2026',
    tabIndex: 1,
  ),
];

/// 25 Mis canjes (888:714)
class P25MyRedemptionsScreen extends StatefulWidget {
  const P25MyRedemptionsScreen({super.key});

  @override
  State<P25MyRedemptionsScreen> createState() => _P25MyRedemptionsScreenState();
}

class _P25MyRedemptionsScreenState extends State<P25MyRedemptionsScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final visible = _redemptions.where((r) => r.tabIndex == _tabIndex).toList();

    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Mis canjes'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  P2FilterChips(
                    labels: const ['Activos', 'Utilizados', 'Vencidos'],
                    selectedIndex: _tabIndex,
                    onSelected: (i) {
                      HapticFeedback.selectionClick();
                      setState(() => _tabIndex = i);
                    },
                  ),
                  const SizedBox(height: 16),
                  if (visible.isEmpty)
                    PecoxEmptyState(
                      icon: Icons.confirmation_number_outlined,
                      title: 'No tienes canjes vencidos',
                      subtitle:
                          'Todos tus cupones han sido aprovechados a tiempo. Sigue sumando puntos en la estación.',
                      actionLabel: 'Explorar recompensas',
                      onAction: () => Navigator.of(context).pushReplacementNamed(
                        AppRoutes.p19Rewards,
                      ),
                    )
                  else ...[
                    ...List.generate(visible.length, (index) {
                      final r = visible[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _RedemptionHistoryCard(data: r),
                      );
                    }),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        'Presenta el código o QR en el establecimiento afiliado.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.muted,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 3),
    );
  }
}

class _RedemptionHistoryCard extends StatelessWidget {
  const _RedemptionHistoryCard({required this.data});

  final _RedemptionData data;

  @override
  Widget build(BuildContext context) {
    final isActive = data.tabIndex == 0;
    return PecoxSurfaceCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  data.title,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.navy,
                  ),
                ),
              ),
              isActive
                  ? const PecoxStatusBadge.active('DISPONIBLE')
                  : const PecoxStatusBadge(
                      label: 'UTILIZADO',
                      tone: PecoxStatusTone.neutral,
                    ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Código: ${data.code} · ${data.points} pts',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.green,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.dateText,
            style: GoogleFonts.inter(fontSize: 12, color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}
