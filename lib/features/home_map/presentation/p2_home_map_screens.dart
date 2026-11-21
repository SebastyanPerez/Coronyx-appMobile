import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/gc_bottom_nav.dart';
import '../../../shared/widgets/gc_pill_button.dart';
import '../../../shared/widgets/p2_common_widgets.dart';
import '../../../shared/widgets/pecox_eco_wallet_card.dart';
import '../../../shared/widgets/pecox_fade_slide_in.dart';
import '../../../shared/widgets/pecox_feedback.dart';
import '../../../shared/widgets/pecox_status_badge.dart';
import '../../../shared/widgets/pecox_surface_card.dart';

/// 09 Inicio mejorado (886:726)
class P09HomeScreen extends StatelessWidget {
  const P09HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            gradient: AppGradients.ecoWalletGradient,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.recycling_rounded,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PECOX',
                              style: GoogleFonts.montserrat(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: AppColors.green,
                                height: 1.0,
                              ),
                            ),
                            Text(
                              'Piloto El Porvenir',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (kDebugMode) ...[
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
                  ],
                  PecoxSurfaceCard(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p29NotificationsUnread,
                    ),
                    borderRadius: AppRadii.pill,
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Icon(
                          Icons.notifications_none_rounded,
                          size: 22,
                          color: AppColors.navy,
                        ),
                        Positioned(
                          right: -1,
                          top: -1,
                          child: Container(
                            width: 9,
                            height: 9,
                            decoration: BoxDecoration(
                              color: AppColors.statusActive,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.white,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '¡BIENVENIDO!',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: AppColors.green,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Hola, Luis',
                style: GoogleFonts.montserrat(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 16),
              PecoxFadeSlideIn(
                child: PecoxEcoWalletCard(
                  points: 200,
                  goalPoints: 500,
                  rewardLabel: 'Canasta básica',
                  streakDays: 4,
                  onTap: () =>
                      Navigator.of(context).pushNamed(AppRoutes.p19Rewards),
                ),
              ),
              const SizedBox(height: 16),
              PecoxFadeSlideIn(
                delay: const Duration(milliseconds: 80),
                child: PecoxSurfaceCard(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.p12ScanQr),
                gradient: AppGradients.mintSurfaceGradient,
                borderColor: AppColors.borderSage,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: AppGradients.ecoWalletGradient,
                        borderRadius: BorderRadius.circular(AppRadii.md),
                      ),
                      child: const Icon(
                        Icons.qr_code_scanner_rounded,
                        color: AppColors.white,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Escanear QR de estación',
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.navy,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Deposita botellas PET de 500 ml y suma +50 pts',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: AppColors.green,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'ACCIONES RÁPIDAS',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _QuickActionCard(
                      icon: Icons.location_on_rounded,
                      title: 'Mapa',
                      subtitle: 'Ubica la máquina',
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRoutes.p10Map,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _QuickActionCard(
                      icon: Icons.local_drink_rounded,
                      title: 'Botella',
                      subtitle: '¿Acepta PET?',
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRoutes.p16ScanProduct,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _QuickActionCard(
                      icon: Icons.card_giftcard_rounded,
                      title: 'Premios',
                      subtitle: 'Canjea puntos',
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRoutes.p19Rewards,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'RACHA E IMPACTO',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _ImpactCard(
                      icon: Icons.local_fire_department_rounded,
                      iconColor: AppColors.statusWarning,
                      iconBg: AppColors.statusWarningBg,
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
                      icon: Icons.eco_rounded,
                      iconColor: AppColors.green,
                      iconBg: AppColors.pointsCard,
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
              PecoxSurfaceCard(
                onTap: () => Navigator.of(context).pushNamed(
                  AppRoutes.gcStatePublic,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.lavender,
                        borderRadius: BorderRadius.circular(AppRadii.md),
                      ),
                      child: const Icon(
                        Icons.menu_book_rounded,
                        color: AppColors.green,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Guía PET y Conocimiento PECOX',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.navy,
                            ),
                          ),
                          Text(
                            'Requisitos de botellas y preguntas frecuentes',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.muted,
                    ),
                  ],
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
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PecoxSurfaceCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.pointsCard,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: AppColors.green),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.navy,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 11,
              color: AppColors.grayText,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _ImpactCard extends StatelessWidget {
  const _ImpactCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PecoxSurfaceCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.navy,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.grayText,
            ),
          ),
        ],
      ),
    );
  }
}

class _StationInfo {
  const _StationInfo({
    required this.name,
    required this.zone,
    required this.distance,
    required this.schedule,
    required this.point,
    required this.isActive,
  });

  final String name;
  final String zone;
  final String distance;
  final String schedule;
  final LatLng point;
  final bool isActive;
}

const _pilotStations = [
  _StationInfo(
    name: 'Estación El Porvenir · Santa Aurora',
    zone: 'Sector Santa Aurora, El Porvenir · Trujillo',
    distance: 'A 400 m de ti',
    schedule: 'Lunes a domingo · 08:00 a 18:00',
    point: LatLng(-8.0815, -79.0031),
    isActive: true,
  ),
  _StationInfo(
    name: 'Estación Plaza El Porvenir (Próxima)',
    zone: 'Av. Pumacahua, El Porvenir · Trujillo',
    distance: 'A 1.2 km de ti',
    schedule: 'En mantenimiento preventivo',
    point: LatLng(-8.0785, -79.0075),
    isActive: false,
  ),
];

Future<void> _openDirections(BuildContext context, LatLng point) async {
  final uri = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=${point.latitude},${point.longitude}',
  );
  final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!launched && context.mounted) {
    PecoxFeedback.showError(
      context,
      'No se pudo abrir la aplicación de mapas.',
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
  int _selectedStationIndex = 0;

  List<_StationInfo> get _visibleStations {
    if (_filterIndex == 1) {
      return _pilotStations.where((s) => s.isActive).toList();
    }
    return _pilotStations;
  }

  @override
  Widget build(BuildContext context) {
    final stations = _visibleStations;
    final safeIndex = _selectedStationIndex.clamp(0, stations.length - 1);
    final selected = stations[safeIndex];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Mapa de estaciones'),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 4, 18, 12),
            child: P2FilterChips(
              labels: const ['Todas', 'Activas ahora', 'Solo PET 500 ml'],
              selectedIndex: _filterIndex,
              onSelected: (i) {
                HapticFeedback.selectionClick();
                setState(() {
                  _filterIndex = i;
                  _selectedStationIndex = 0;
                });
              },
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    initialCenter: selected.point,
                    initialZoom: 15.2,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.pecox.app',
                    ),
                    MarkerLayer(
                      markers: List.generate(stations.length, (index) {
                        final station = stations[index];
                        final isSelected = index == safeIndex;
                        return Marker(
                          point: station.point,
                          width: 48,
                          height: 48,
                          child: GestureDetector(
                            onTap: () {
                              HapticFeedback.lightImpact();
                              setState(() => _selectedStationIndex = index);
                            },
                            child: AnimatedScale(
                              scale: isSelected ? 1.15 : 0.95,
                              duration: const Duration(milliseconds: 180),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? (station.isActive
                                          ? AppColors.green
                                          : AppColors.statusError)
                                      : AppColors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: station.isActive
                                        ? AppColors.green
                                        : AppColors.statusError,
                                    width: 2.5,
                                  ),
                                  boxShadow: AppShadows.cardShadow,
                                ),
                                child: Icon(
                                  Icons.recycling_rounded,
                                  size: 22,
                                  color: isSelected
                                      ? AppColors.white
                                      : (station.isActive
                                          ? AppColors.green
                                          : AppColors.statusError),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.42,
                  minChildSize: 0.28,
                  maxChildSize: 0.62,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                        boxShadow: AppShadows.navShadow,
                      ),
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                        children: [
                          Center(
                            child: Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: AppColors.borderSage,
                                borderRadius: BorderRadius.circular(
                                  AppRadii.pill,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              selected.isActive
                                  ? const PecoxStatusBadge.active(
                                      'Estación Activa',
                                    )
                                  : const PecoxStatusBadge.error(
                                      'Fuera de servicio',
                                    ),
                              const Spacer(),
                              Text(
                                selected.distance,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            selected.name,
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.navy,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            selected.zone,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.muted,
                            ),
                          ),
                          const SizedBox(height: 14),
                          PecoxSurfaceCard(
                            gradient: AppGradients.mintSurfaceGradient,
                            borderColor: AppColors.borderSage,
                            boxShadow: null,
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.local_drink_rounded,
                                  color: AppColors.green,
                                  size: 22,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    'Acepta únicamente botellas PET de 500 ml vacías y limpias (+50 pts c/u).',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.navy,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: GcPillButton(
                                  label: 'Ver detalle',
                                  onPressed: () =>
                                      Navigator.of(context).pushNamed(
                                    AppRoutes.p11PointDetail,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: GcPillButton(
                                  label: 'Escanear QR',
                                  isPrimary: true,
                                  onPressed: selected.isActive
                                      ? () => Navigator.of(context).pushNamed(
                                            AppRoutes.p12ScanQr,
                                          )
                                      : () => PecoxFeedback.showInfo(
                                            context,
                                            'Esta estación está fuera de servicio temporalmente.',
                                          ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 1),
    );
  }
}

/// 11 Detalle del punto (886:809)
class P11PointDetailScreen extends StatelessWidget {
  const P11PointDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final station = _pilotStations.first;

    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Detalle de estación'),
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
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(
                                  AppRadii.pill,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: const BoxDecoration(
                                      color: AppColors.mint,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Estación Activa',
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.recycling_rounded,
                              color: AppColors.mint,
                              size: 28,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          station.name,
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${station.distance} · ${station.zone}',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.white.withValues(alpha: 0.9),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(
                              Icons.schedule_rounded,
                              size: 16,
                              color: AppColors.mint,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              station.schedule,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mint,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'REQUISITOS DE BOTELLA (MVP PET)',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _RequirementRow(
                    icon: Icons.local_drink_rounded,
                    title: 'Solo plástico PET de 500 ml',
                    subtitle:
                        'Botellas estándar de agua o gaseosa (no vidrio ni latas).',
                  ),
                  const SizedBox(height: 10),
                  const _RequirementRow(
                    icon: Icons.water_drop_outlined,
                    title: 'Vacía y sin líquido',
                    subtitle:
                        'La estación valida el peso exacto antes de abrir la compuerta.',
                  ),
                  const SizedBox(height: 10),
                  const _RequirementRow(
                    icon: Icons.verified_rounded,
                    title: 'Presiona "Recibir QR" en la máquina',
                    subtitle:
                        'Al terminar, escanea el código generado para sumar tus puntos.',
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: GcPillButton(
                          label: 'Cómo llegar',
                          onPressed: () =>
                              _openDirections(context, station.point),
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

class _RequirementRow extends StatelessWidget {
  const _RequirementRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return PecoxSurfaceCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.pointsCard,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: AppColors.green),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.navy,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
