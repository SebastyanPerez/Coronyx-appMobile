import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/gc_bottom_nav.dart';
import '../../../shared/widgets/gc_pill_button.dart';
import '../../../shared/widgets/p2_common_widgets.dart';
import '../../../shared/widgets/pecox_feedback.dart';
import '../../../shared/widgets/pecox_status_badge.dart';
import '../../../shared/widgets/pecox_surface_card.dart';

void _showManualCodeSheet(BuildContext context) {
  final controller = TextEditingController();
  PecoxFeedback.showSheet<void>(
    context: context,
    builder: (ctx) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingresar código manual',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.navy,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Escribe el código corto que aparece en la pantalla de la estación PECOX.',
          style: GoogleFonts.inter(fontSize: 13, color: AppColors.muted),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller,
          textCapitalization: TextCapitalization.characters,
          decoration: const InputDecoration(
            hintText: 'Ej. PCX-4821',
            prefixIcon: Icon(Icons.tag_rounded, color: AppColors.green),
          ),
        ),
        const SizedBox(height: 18),
        GcPillButton(
          label: 'Validar código',
          isPrimary: true,
          onPressed: () {
            Navigator.of(ctx).pop();
            Navigator.of(context).pushNamed(AppRoutes.p13QrValidating);
          },
        ),
      ],
    ),
  );
}

/// 12 Escáner QR (886:848)
class P12ScanQrScreen extends StatefulWidget {
  const P12ScanQrScreen({super.key});

  @override
  State<P12ScanQrScreen> createState() => _P12ScanQrScreenState();
}

class _P12ScanQrScreenState extends State<P12ScanQrScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scanController;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Escanear QR'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                children: [
                  Text(
                    'Centra el código QR de la estación PECOX dentro del marco.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 18),
                  PecoxSurfaceCard(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p13QrValidating,
                    ),
                    backgroundColor: AppColors.navy,
                    borderColor: null,
                    borderRadius: AppRadii.xl,
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                      height: 260,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.mint,
                                width: 2.5,
                              ),
                              borderRadius: BorderRadius.circular(AppRadii.lg),
                            ),
                            child: const Icon(
                              Icons.qr_code_2_rounded,
                              size: 96,
                              color: AppColors.mint,
                            ),
                          ),
                          AnimatedBuilder(
                            animation: _scanController,
                            builder: (context, _) {
                              final offsetY =
                                  (_scanController.value * 160) - 80;
                              return Transform.translate(
                                offset: Offset(0, offsetY),
                                child: Container(
                                  width: 176,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: AppColors.rewardsHero,
                                    borderRadius: BorderRadius.circular(
                                      AppRadii.pill,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x88A1F2DE),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const PecoxStatusBadge.active('Cámara activa'),
                  const SizedBox(height: 10),
                  Text(
                    'Mantén el teléfono estable. La lectura es automática.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GcPillButton(
                    label: 'Simular lectura QR exitosa',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p13QrValidating,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Ingresar código manual',
                    onPressed: () => _showManualCodeSheet(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 2),
    );
  }
}

/// 13 QR · validando entrega (886:877)
class P13QrValidatingScreen extends StatefulWidget {
  const P13QrValidatingScreen({super.key});

  @override
  State<P13QrValidatingScreen> createState() => _P13QrValidatingScreenState();
}

class _P13QrValidatingScreenState extends State<P13QrValidatingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(
        AppRoutes.p15RecyclingRegistered,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Validando entrega'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PecoxSurfaceCard(
                    padding: const EdgeInsets.all(28),
                    borderRadius: AppRadii.xl,
                    child: Column(
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
                          'Validando tu ticket QR',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.navy,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Verificando depósito de botella PET 500 ml en la estación El Porvenir...',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
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

/// 14 QR · error recuperable (886:886)
class P14QrErrorScreen extends StatelessWidget {
  const P14QrErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'No pudimos validar'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PecoxSurfaceCard(
                    borderRadius: AppRadii.xl,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          decoration: const BoxDecoration(
                            color: AppColors.statusErrorBg,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.error_outline_rounded,
                            size: 36,
                            color: AppColors.statusError,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Código no válido o ya utilizado',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.navy,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Comprueba que el QR pertenezca a la estación PECOX (El Porvenir) o ingresa el código corto manualmente.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  GcPillButton(
                    label: 'Intentar nuevamente',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.p12ScanQr,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Ingresar código manual',
                    onPressed: () => _showManualCodeSheet(context),
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

/// 15 Reciclaje registrado (886:898)
class P15RecyclingRegisteredScreen extends StatefulWidget {
  const P15RecyclingRegisteredScreen({super.key});

  @override
  State<P15RecyclingRegisteredScreen> createState() =>
      _P15RecyclingRegisteredScreenState();
}

class _P15RecyclingRegisteredScreenState
    extends State<P15RecyclingRegisteredScreen> {
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
                width: 84,
                height: 84,
                decoration: const BoxDecoration(
                  gradient: AppGradients.ecoWalletGradient,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 46,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                '¡Reciclaje registrado!',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 12),
              TweenAnimationBuilder<int>(
                tween: IntTween(begin: 0, end: 50),
                duration: const Duration(milliseconds: 550),
                builder: (context, value, _) {
                  return Text(
                    '+$value pts',
                    style: GoogleFonts.montserrat(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green,
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              const PecoxStatusBadge.warning('Racha activa · 5 días'),
              const SizedBox(height: 24),
              PecoxSurfaceCard(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detalle del registro',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.navy,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const _DetailItem(
                      icon: Icons.local_drink_rounded,
                      text: 'Material: Botella PET (500 ml)',
                    ),
                    const SizedBox(height: 8),
                    const _DetailItem(
                      icon: Icons.location_on_rounded,
                      text: 'Estación El Porvenir · Santa Aurora',
                    ),
                    const SizedBox(height: 8),
                    const _DetailItem(
                      icon: Icons.schedule_rounded,
                      text: 'Validado hoy · 10:24',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              GcPillButton(
                label: 'Ir a recompensas',
                isPrimary: true,
                onPressed: () => Navigator.of(context).pushReplacementNamed(
                  AppRoutes.p19Rewards,
                ),
              ),
              const SizedBox(height: 12),
              GcPillButton(
                label: 'Volver al inicio',
                onPressed: () => Navigator.of(context).pushReplacementNamed(
                  AppRoutes.p09Home,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  const _DetailItem({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.green),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(fontSize: 13, color: AppColors.muted),
          ),
        ),
      ],
    );
  }
}

/// 16 Escanear producto (886:912)
class P16ScanProductScreen extends StatelessWidget {
  const P16ScanProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Identificar botella'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                children: [
                  Text(
                    'Comprueba si tu botella es PET de 500 ml aceptada por la estación.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 18),
                  PecoxSurfaceCard(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p18ProductResult,
                    ),
                    gradient: AppGradients.mintSurfaceGradient,
                    borderColor: AppColors.borderSage,
                    borderRadius: AppRadii.xl,
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Center(
                        child: Container(
                          width: 190,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.green,
                              width: 2.5,
                            ),
                            borderRadius: BorderRadius.circular(AppRadii.lg),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.local_drink_rounded,
                                size: 64,
                                color: AppColors.green,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'BOTELLA PET 500 ml',
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const PecoxStatusBadge.active('Buena iluminación'),
                  const SizedBox(height: 10),
                  Text(
                    'Coloca una sola botella dentro del marco.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GcPillButton(
                    label: 'Ver resultado detectado (PET)',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p18ProductResult,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'No reconoce el producto',
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p17ProductHelp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 2),
    );
  }
}

/// 17 Producto · ayuda de detección (886:941)
class P17ProductHelpScreen extends StatelessWidget {
  const P17ProductHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Mejora la detección'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                children: [
                  const PecoxStatusBadge.warning('Poca iluminación'),
                  const SizedBox(height: 16),
                  PecoxSurfaceCard(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prueba lo siguiente',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.navy,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const _DetailItem(
                          icon: Icons.center_focus_strong_rounded,
                          text: 'Acerca la botella al centro del marco',
                        ),
                        const SizedBox(height: 10),
                        const _DetailItem(
                          icon: Icons.wb_sunny_rounded,
                          text: 'Busca una zona con mejor iluminación',
                        ),
                        const SizedBox(height: 10),
                        const _DetailItem(
                          icon: Icons.flip_rounded,
                          text: 'Evita reflejos y fondos recargados',
                        ),
                        const SizedBox(height: 10),
                        const _DetailItem(
                          icon: Icons.qr_code_rounded,
                          text: 'Muestra la etiqueta o símbolo PET (1)',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  GcPillButton(
                    label: 'Volver a escanear',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.p16ScanProduct,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Ver guía manual PET',
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStatePublicPetSheet,
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

/// 18 Resultado del producto (886:954)
class P18ProductResultScreen extends StatelessWidget {
  const P18ProductResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Resultado'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: Column(
                children: [
                  const PecoxStatusBadge.active(
                    'Aceptado en estación · PET 500 ml',
                  ),
                  const SizedBox(height: 16),
                  PecoxSurfaceCard(
                    gradient: AppGradients.ecoWalletGradient,
                    borderColor: null,
                    borderRadius: AppRadii.xl,
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Column(
                        children: [
                          const Icon(
                            Icons.local_drink_rounded,
                            size: 64,
                            color: AppColors.mint,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'BOTELLA PET · TIPO 1',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Plástico PET (500 ml)',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Asegúrate de que esté vacía y limpia antes de depositarla en la estación PECOX para ganar +50 pts.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      height: 1.45,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GcPillButton(
                    label: 'Buscar estación cercana',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p10Map,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Ver ficha técnica PET',
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStatePublicPetSheet,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 2),
    );
  }
}
