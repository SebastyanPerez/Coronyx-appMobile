import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/gc_bottom_nav.dart';
import '../../../shared/widgets/gc_pill_button.dart';
import '../../../shared/widgets/p2_common_widgets.dart';

/// 09 Inicio mejorado (886:726)
class P09HomeScreen extends StatelessWidget {
  const P09HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'PECOX',
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed(AppRoutes.catalog),
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
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p29NotificationsUnread,
                    ),
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.borderSage),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '•',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '¡BIENVENIDO!',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Hola, Luis',
                style: GoogleFonts.montserrat(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.p19Rewards),
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.pointsCard,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PUNTOS DISPONIBLES',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.muted,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '200',
                        style: GoogleFonts.montserrat(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: AppColors.navy,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '300 pts para tu próxima recompensa',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'ACCIONES RÁPIDAS',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _QuickActionCard(
                      title: 'Mapa',
                      subtitle: 'Ubica un punto',
                      backgroundColor: AppColors.white,
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRoutes.p10Map,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _QuickActionCard(
                      title: 'QR',
                      subtitle: 'Registra entrega',
                      backgroundColor: AppColors.pointsCard,
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRoutes.p12ScanQr,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _QuickActionCard(
                      title: 'Producto',
                      subtitle: 'Identifica material',
                      backgroundColor: AppColors.white,
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRoutes.p16ScanProduct,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'RACHA E IMPACTO',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _ImpactCard(
                      title: '4 días seguidos',
                      subtitle: 'Recicla hoy para mantenerla',
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRoutes.p31Achievements,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _ImpactCard(
                      title: '10 kg reciclados',
                      subtitle: '5 kg CO₂ evitados',
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRoutes.p32EnvironmentalEd,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GcPillButton(
                label: 'Centro de conocimiento PECOX (GC)',
                onPressed: () => Navigator.of(context).pushNamed(
                  AppRoutes.gcStatePublic,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 0),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(AppRadii.lg),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        child: Container(
          height: 128,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderSage),
            borderRadius: BorderRadius.circular(AppRadii.lg),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.grayText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImpactCard extends StatelessWidget {
  const _ImpactCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppRadii.lg),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        child: Container(
          height: 112,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderSage),
            borderRadius: BorderRadius.circular(AppRadii.lg),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.grayText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 10 Mapa mejorado (886:770)
class P10MapScreen extends StatefulWidget {
  const P10MapScreen({super.key});

  @override
  State<P10MapScreen> createState() => _P10MapScreenState();
}

class _P10MapScreenState extends State<P10MapScreen> {
  int _filterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Mapa de reciclaje'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  P2FilterChips(
                    labels: const ['Todos', 'PET 500 ml', 'Aluminio', 'Papel'],
                    selectedIndex: _filterIndex,
                    onSelected: (i) => setState(() => _filterIndex = i),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 360,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.thumbBg,
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                      border: Border.all(color: AppColors.borderSage),
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 60,
                          top: 80,
                          child: _MapPin(isSelected: true),
                        ),
                        const Positioned(
                          right: 60,
                          top: 50,
                          child: _MapPin(isSelected: false),
                        ),
                        const Positioned(
                          right: 45,
                          bottom: 70,
                          child: _MapPin(isSelected: false),
                        ),
                        const Positioned(
                          left: 140,
                          bottom: 45,
                          child: _MapPin(isSelected: false),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p11PointDetail,
                    ),
                    borderRadius: BorderRadius.circular(AppRadii.lg),
                    child: Container(
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
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Estación El Porvenir · Santa Aurora',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.navy,
                                  ),
                                ),
                              ),
                              Text(
                                'ACTIVA',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '400 m · PET vacío 500 ml, aluminio y papel seco',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.muted,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Ver detalle completo →',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 1),
    );
  }
}

class _MapPin extends StatelessWidget {
  const _MapPin({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.green : AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.green, width: 2),
      ),
      alignment: Alignment.center,
      child: Text(
        '⌖',
        style: TextStyle(
          fontSize: 18,
          color: isSelected ? AppColors.white : AppColors.green,
        ),
      ),
    );
  }
}

/// 11 Detalle del punto (886:809)
class P11PointDetailScreen extends StatelessWidget {
  const P11PointDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Detalle del punto'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 188,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.thumbBg,
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'FOTO DEL PUNTO',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Estación El Porvenir · Santa Aurora',
                          style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.navy,
                          ),
                        ),
                      ),
                      Text(
                        'ACTIVA',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A 400 m de ti · Sector Santa Aurora (-8.0815, -79.0031)',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sector Santa Aurora, Distrito de El Porvenir · Trujillo.',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'MATERIALES ACEPTADOS',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    children: ['PET 500 ml', 'Aluminio', 'Papel y cartón seco']
                        .map(
                          (m) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.pointsCard,
                              borderRadius: BorderRadius.circular(
                                AppRadii.pill,
                              ),
                            ),
                            child: Text(
                              m,
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.green,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: GcPillButton(
                          label: 'Cómo llegar',
                          onPressed: () => Navigator.of(context).pushNamed(
                            AppRoutes.p10Map,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GcPillButton(
                          label: 'Escanear QR aquí',
                          isPrimary: true,
                          onPressed: () => Navigator.of(context).pushNamed(
                            AppRoutes.p12ScanQr,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Horario: lunes a domingo · 08:00 a 18:00',
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
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 1),
    );
  }
}
