import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/gc_bottom_nav.dart';
import '../../../shared/widgets/gc_pill_button.dart';
import '../../../shared/widgets/p2_common_widgets.dart';

/// 19 Recompensas mejoradas (888:592)
class P19RewardsScreen extends StatefulWidget {
  const P19RewardsScreen({super.key});

  @override
  State<P19RewardsScreen> createState() => _P19RewardsScreenState();
}

class _P19RewardsScreenState extends State<P19RewardsScreen> {
  int _filterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Recompensas'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: AppColors.rewardsHero,
                      borderRadius: BorderRadius.circular(AppRadii.xl),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'PUNTOS DISPONIBLES',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.navy,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '200',
                          style: GoogleFonts.montserrat(
                            fontSize: 42,
                            fontWeight: FontWeight.w700,
                            color: AppColors.navy,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  P2FilterChips(
                    labels: const ['Todos', 'Abarrotes', 'Limpieza', 'Otros'],
                    selectedIndex: _filterIndex,
                    onSelected: (i) => setState(() => _filterIndex = i),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'PREMIOS DISPONIBLES',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _RewardItemCard(
                    title: 'Detergente Multiusos',
                    cost: 'Costo: 80 pts',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p20RewardDetail,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _RewardItemCard(
                    title: 'Pack de arroz y menestras',
                    cost: 'Costo: 150 pts',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p20RewardDetail,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _RewardItemCard(
                    title: 'Canasta básica familiar',
                    cost: 'Costo: 500 pts',
                    isLocked: true,
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p24InsufficientBalance,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _RewardItemCard(
                    title: 'Aceite de cocina 1L',
                    cost: 'Costo: 120 pts',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p20RewardDetail,
                    ),
                  ),
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
    required this.title,
    required this.cost,
    required this.onTap,
    this.isLocked = false,
  });

  final String title;
  final String cost;
  final VoidCallback onTap;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isLocked ? AppColors.lockedBg : AppColors.softAlt,
      borderRadius: BorderRadius.circular(AppRadii.lg),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderLight),
            borderRadius: BorderRadius.circular(AppRadii.lg),
          ),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: isLocked
                      ? const Color(0xFFECEEED)
                      : AppColors.thumbBg,
                  borderRadius: BorderRadius.circular(AppRadii.md),
                ),
                alignment: Alignment.center,
                child: Text(
                  '◇',
                  style: GoogleFonts.inter(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
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
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isLocked ? AppColors.grayText : AppColors.navy,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cost,
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
                width: 94,
                height: 44,
                decoration: BoxDecoration(
                  color: isLocked ? AppColors.white : AppColors.green,
                  border:
                      isLocked ? Border.all(color: AppColors.borderSage) : null,
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                ),
                alignment: Alignment.center,
                child: Text(
                  isLocked ? 'Bloqueado' : 'Canjear',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isLocked ? AppColors.grayText : AppColors.white,
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

/// 20 Detalle del premio (888:653)
class P20RewardDetailScreen extends StatelessWidget {
  const P20RewardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Detalle del premio'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(28, 8, 28, 24),
              child: Column(
                children: [
                  Container(
                    height: 202,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.thumbBg,
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '◇',
                      style: GoogleFonts.inter(
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Detergente Multiusos',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Producto de limpieza de 1 litro. Canje válido en establecimientos afiliados.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.softAlt,
                      border: Border.all(color: AppColors.borderSage),
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Costo',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: AppColors.muted,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '80 pts',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                              const SizedBox(height: 6),
                              Text(
                                '120 pts',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
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
                  const SizedBox(height: 28),
                  GcPillButton(
                    label: 'Canjear premio',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p21ConfirmRedeem,
                    ),
                  ),
                  const SizedBox(height: 14),
                  GcPillButton(
                    label: 'Ver condiciones',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Válido presentando código en tienda afiliada.',
                          ),
                        ),
                      );
                    },
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
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppRadii.xl),
                border: Border.all(color: AppColors.borderSage),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '✓',
                    style: GoogleFonts.montserrat(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
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
                  const SizedBox(height: 12),
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
class P22ProcessingRedeemScreen extends StatelessWidget {
  const P22ProcessingRedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '80',
                style: GoogleFonts.montserrat(
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  color: AppColors.green,
                ),
              ),
              Text(
                'pts',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Procesando tu canje',
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Estamos reservando el premio y generando tu comprobante.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'PROCESANDO',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.green,
                ),
              ),
              const SizedBox(height: 32),
              GcPillButton(
                label: 'Ver comprobante generado →',
                isPrimary: true,
                onPressed: () => Navigator.of(context).pushReplacementNamed(
                  AppRoutes.p23RedeemSuccess,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 23 Canje realizado (888:689)
class P23RedeemSuccessScreen extends StatelessWidget {
  const P23RedeemSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(36, 40, 36, 24),
          child: Column(
            children: [
              Text(
                '✓',
                style: GoogleFonts.montserrat(
                  fontSize: 56,
                  fontWeight: FontWeight.w700,
                  color: AppColors.green,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '¡Canje realizado!',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Detergente Multiusos',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.pointsCard,
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                ),
                child: Column(
                  children: [
                    Text(
                      'CÓDIGO DE CANJE',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.muted,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'PCX-8042',
                      style: GoogleFonts.montserrat(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Válido hasta el 30/07/2026',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Nuevo saldo: 120 pts',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 28),
              GcPillButton(
                label: 'Ver mis canjes',
                isPrimary: true,
                onPressed: () => Navigator.of(context).pushReplacementNamed(
                  AppRoutes.p25MyRedemptions,
                ),
              ),
              const SizedBox(height: 14),
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
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppRadii.xl),
                border: Border.all(color: AppColors.borderSage),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '!',
                    style: GoogleFonts.montserrat(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFB91C1C),
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
                  const SizedBox(height: 12),
                  Text(
                    'Te faltan 300 puntos para canjear la Canasta básica familiar. Sigue reciclando para alcanzar la meta.',
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
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Mis canjes'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  P2FilterChips(
                    labels: const ['Activos', 'Utilizados', 'Vencidos'],
                    selectedIndex: _tabIndex,
                    onSelected: (i) => setState(() => _tabIndex = i),
                  ),
                  const SizedBox(height: 16),
                  const _RedemptionHistoryCard(
                    title: 'Detergente Multiusos',
                    subtitle:
                        'Código: PCX-8042 · 80 pts\nDisponible hasta 30/07/2026',
                    status: 'DISPONIBLE',
                  ),
                  const SizedBox(height: 12),
                  const _RedemptionHistoryCard(
                    title: 'Aceite de cocina 1L',
                    subtitle:
                        'Código: PCX-1108 · 120 pts\nUtilizado el 02/07/2026',
                    status: 'UTILIZADO',
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Presenta el código o QR en el establecimiento afiliado.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.muted,
                    ),
                  ),
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
  const _RedemptionHistoryCard({
    required this.title,
    required this.subtitle,
    required this.status,
  });

  final String title;
  final String subtitle;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softAlt,
        border: Border.all(color: AppColors.borderSage),
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.navy,
                  ),
                ),
              ),
              Text(
                status,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}
