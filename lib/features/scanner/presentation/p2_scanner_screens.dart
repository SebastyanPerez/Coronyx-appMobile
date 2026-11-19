import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/gc_bottom_nav.dart';
import '../../../shared/widgets/gc_pill_button.dart';
import '../../../shared/widgets/p2_common_widgets.dart';

/// 12 Escáner QR (886:848)
class P12ScanQrScreen extends StatelessWidget {
  const P12ScanQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Escanear QR'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 24),
              child: Column(
                children: [
                  Text(
                    'Centra el código del contenedor dentro del marco.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p13QrValidating,
                    ),
                    borderRadius: BorderRadius.circular(AppRadii.xl),
                    child: Container(
                      height: 320,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.navy,
                        borderRadius: BorderRadius.circular(AppRadii.xl),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.mint,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(AppRadii.lg),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'QR',
                          style: GoogleFonts.montserrat(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: AppColors.mint,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Cámara activa',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.green,
                    ),
                  ),
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
                    label: 'Ingresar código manual / Ver error QR',
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p14QrError,
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

/// 13 QR · validando entrega (886:877)
class P13QrValidatingScreen extends StatelessWidget {
  const P13QrValidatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Validando entrega'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '···',
                    style: GoogleFonts.montserrat(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Estamos validando el código',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No cierres esta pantalla. El proceso puede tardar unos segundos.',
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
                    label: 'Completar validación →',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p15RecyclingRegistered,
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
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'No pudimos validar'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '!',
                    style: GoogleFonts.montserrat(
                      fontSize: 56,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFB91C1C),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Código no válido o ya utilizado',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Comprueba que el QR pertenezca a la estación PECOX (El Porvenir) o ingresa el código manualmente.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 36),
                  GcPillButton(
                    label: 'Intentar nuevamente',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.p12ScanQr,
                    ),
                  ),
                  const SizedBox(height: 14),
                  GcPillButton(
                    label: 'Ingresar código manual',
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p15RecyclingRegistered,
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

/// 15 Reciclaje registrado (886:898)
class P15RecyclingRegisteredScreen extends StatelessWidget {
  const P15RecyclingRegisteredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 32, 30, 24),
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
              const SizedBox(height: 16),
              Text(
                '¡Reciclaje registrado!',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Ganaste',
                style: GoogleFonts.inter(fontSize: 13, color: AppColors.muted),
              ),
              const SizedBox(height: 4),
              Text(
                '+50 pts',
                style: GoogleFonts.montserrat(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: AppColors.green,
                ),
              ),
              const SizedBox(height: 24),
              Container(
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
                    Text(
                      'Detalle del registro',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.navy,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Material: Plástico PET (500 ml)\nEstación El Porvenir · Santa Aurora · Hoy 10:24',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Racha: 5 días',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.green,
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
              const SizedBox(height: 14),
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

/// 16 Escanear producto (886:912)
class P16ScanProductScreen extends StatelessWidget {
  const P16ScanProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Escanear producto'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 24),
              child: Column(
                children: [
                  Text(
                    'Identifica el material y aprende cómo reciclarlo.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p18ProductResult,
                    ),
                    borderRadius: BorderRadius.circular(AppRadii.xl),
                    child: Container(
                      height: 320,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.thumbBg,
                        borderRadius: BorderRadius.circular(AppRadii.xl),
                        border: Border.all(color: AppColors.borderSage),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: 210,
                        height: 220,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.green,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(AppRadii.lg),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'PRODUCTO',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Buena iluminación',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Coloca un solo producto dentro del marco.',
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
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Mejora la detección'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(26, 20, 26, 24),
              child: Column(
                children: [
                  Text(
                    'POCA ILUMINACIÓN',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.softAlt,
                      border: Border.all(color: AppColors.borderSage),
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prueba lo siguiente',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.navy,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '• Acerca el producto al marco\n'
                          '• Busca una zona con más luz\n'
                          '• Evita reflejos y fondos recargados\n'
                          '• Muestra la etiqueta o código',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            height: 1.5,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  GcPillButton(
                    label: 'Volver a escanear',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.p16ScanProduct,
                    ),
                  ),
                  const SizedBox(height: 14),
                  GcPillButton(
                    label: 'Buscar material manualmente',
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
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Resultado'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(28, 12, 28, 24),
              child: Column(
                children: [
                  Text(
                    'RECICLABLE · TIPO 1',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 176,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.thumbBg,
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'BOTELLA PET',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Plástico PET',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Deposítalo limpio y seco en el contenedor amarillo.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 28),
                  GcPillButton(
                    label: 'Buscar punto cercano',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p10Map,
                    ),
                  ),
                  const SizedBox(height: 14),
                  GcPillButton(
                    label: 'Ver más información',
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
