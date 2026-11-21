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

/// 26 Perfil mejorado (891:592) + Acceso a Centro de Conocimiento (GC)
class P26ProfileScreen extends StatelessWidget {
  const P26ProfileScreen({super.key});

  void _showLogoutSheet(BuildContext context) {
    PecoxFeedback.showSheet<void>(
      context: context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: AppColors.statusErrorBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.logout_rounded,
              color: AppColors.statusError,
              size: 28,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            '¿Cerrar sesión?',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.navy,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tendrás que volver a ingresar tus credenciales para acceder a PECOX.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: AppColors.muted,
            ),
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
                  label: 'Cerrar sesión',
                  isPrimary: true,
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    Navigator.of(context).pushReplacementNamed(
                      AppRoutes.p01Login,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Mi perfil', showBack: false),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                children: [
                  PecoxSurfaceCard(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          width: 84,
                          height: 84,
                          decoration: const BoxDecoration(
                            gradient: AppGradients.ecoWalletGradient,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'LG',
                            style: GoogleFonts.montserrat(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Luis Gamboa',
                          style: GoogleFonts.montserrat(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: AppColors.navy,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'luis@pecox.app · DNI ••••5678',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.muted,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const PecoxStatusBadge.active('Eco Básico · Nivel 1'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(
                        child: _ProfileStatCard(
                          icon: Icons.stars_rounded,
                          iconColor: AppColors.statusWarning,
                          iconBg: AppColors.statusWarningBg,
                          value: '200',
                          label: 'Puntos',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _ProfileStatCard(
                          icon: Icons.local_drink_rounded,
                          iconColor: AppColors.green,
                          iconBg: AppColors.pointsCard,
                          value: '24',
                          label: 'Botellas PET',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _ProfileStatCard(
                          icon: Icons.eco_rounded,
                          iconColor: AppColors.greenLight,
                          iconBg: AppColors.pointsCard,
                          value: '10 kg',
                          label: 'Reciclados',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _ProfileMenuTile(
                    icon: Icons.library_books_rounded,
                    label: 'Centro de conocimiento PECOX (GC)',
                    isHighlighted: true,
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStatePublic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ProfileMenuTile(
                    icon: Icons.confirmation_number_rounded,
                    label: 'Mis canjes',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p25MyRedemptions,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ProfileMenuTile(
                    icon: Icons.emoji_events_rounded,
                    label: 'Logros y ranking',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p31Achievements,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ProfileMenuTile(
                    icon: Icons.menu_book_rounded,
                    label: 'Educación ambiental PET',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p32EnvironmentalEd,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ProfileMenuTile(
                    icon: Icons.edit_rounded,
                    label: 'Editar perfil',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p27EditProfile,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ProfileMenuTile(
                    icon: Icons.logout_rounded,
                    label: 'Cerrar sesión',
                    isDestructive: true,
                    onTap: () => _showLogoutSheet(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 4),
    );
  }
}

class _ProfileStatCard extends StatelessWidget {
  const _ProfileStatCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return PecoxSurfaceCard(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Column(
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
            value,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.navy,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuTile extends StatelessWidget {
  const _ProfileMenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isHighlighted = false,
    this.isDestructive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isHighlighted;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final fgColor = isDestructive
        ? AppColors.statusError
        : (isHighlighted ? AppColors.green : AppColors.navy);
    final iconBg = isDestructive
        ? AppColors.statusErrorBg
        : (isHighlighted ? AppColors.white : AppColors.pointsCard);

    return PecoxSurfaceCard(
      onTap: onTap,
      gradient: isHighlighted ? AppGradients.mintSurfaceGradient : null,
      borderColor: isHighlighted ? AppColors.borderSage : AppColors.borderLight,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 19, color: fgColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: fgColor,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: isDestructive ? AppColors.statusError : AppColors.muted,
          ),
        ],
      ),
    );
  }
}

/// 27 Editar perfil (891:632)
class P27EditProfileScreen extends StatelessWidget {
  const P27EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Editar perfil'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 86,
                        height: 86,
                        decoration: const BoxDecoration(
                          gradient: AppGradients.ecoWalletGradient,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'LG',
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => PecoxFeedback.showInfo(
                          context,
                          'Selección de foto disponible al conectar almacenamiento.',
                        ),
                        borderRadius: BorderRadius.circular(AppRadii.pill),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.borderSage),
                            boxShadow: AppShadows.cardShadow,
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            size: 15,
                            color: AppColors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  PecoxSurfaceCard(
                    padding: const EdgeInsets.all(18),
                    child: const Column(
                      children: [
                        P2FormField(
                          label: 'NOMBRE COMPLETO',
                          initialValue: 'Luis Gamboa',
                        ),
                        SizedBox(height: 16),
                        P2FormField(
                          label: 'CORREO ELECTRÓNICO',
                          initialValue: 'luis@pecox.app',
                        ),
                        SizedBox(height: 16),
                        P2FormField(
                          label: 'TIPO DE DOCUMENTO',
                          initialValue: 'DNI',
                        ),
                        SizedBox(height: 16),
                        P2FormField(
                          label: 'NÚMERO DE DOCUMENTO',
                          initialValue: '••••5678',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  GcPillButton(
                    label: 'Guardar cambios',
                    isPrimary: true,
                    onPressed: () {
                      PecoxFeedback.showSuccess(
                        context,
                        'Cambios guardados correctamente.',
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 4),
    );
  }
}

/// 28 Confirmar cierre de sesión (891:669)
class P28ConfirmLogoutScreen extends StatelessWidget {
  const P28ConfirmLogoutScreen({super.key});

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
                      color: AppColors.statusErrorBg,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.logout_rounded,
                      size: 28,
                      color: AppColors.statusError,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '¿Cerrar sesión?',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Tendrás que volver a ingresar tus credenciales para acceder a PECOX.',
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
                          label: 'Cerrar sesión',
                          isPrimary: true,
                          onPressed: () =>
                              Navigator.of(context).pushReplacementNamed(
                            AppRoutes.p01Login,
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

/// 29 Notificaciones · no leídas (891:680)
class P29NotificationsUnreadScreen extends StatelessWidget {
  const P29NotificationsUnreadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          P2Header(
            title: 'Notificaciones',
            trailing: InkWell(
              onTap: () {
                PecoxFeedback.showSuccess(
                  context,
                  'Todas las notificaciones marcadas como leídas.',
                );
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.p30NotificationsRead,
                );
              },
              borderRadius: BorderRadius.circular(AppRadii.pill),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  'Marcar leído',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.green,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              children: const [
                _NotificationCard(
                  icon: Icons.stars_rounded,
                  title: 'Tienes puntos por canjear',
                  body: '200 pts acumulados. Revisa las recompensas.',
                  time: 'Hace 5 min',
                  unread: true,
                ),
                SizedBox(height: 10),
                _NotificationCard(
                  icon: Icons.location_on_rounded,
                  title: 'Estación cercana activa',
                  body:
                      'Estación El Porvenir · Santa Aurora a 400 m. Recibe botellas PET de 500 ml.',
                  time: 'Hace 2 h',
                  unread: true,
                ),
                SizedBox(height: 10),
                _NotificationCard(
                  icon: Icons.local_fire_department_rounded,
                  title: 'No pierdas tu racha',
                  body: 'Llevas 4 días seguidos. Recicla hoy para mantenerla.',
                  time: 'Hace 4 h',
                  unread: true,
                ),
                SizedBox(height: 10),
                _NotificationCard(
                  icon: Icons.card_giftcard_rounded,
                  title: 'Nueva recompensa disponible',
                  body: 'Se agregó un nuevo premio a Abarrotes.',
                  time: 'Hace 3 días',
                  unread: false,
                ),
                SizedBox(height: 10),
                _NotificationCard(
                  icon: Icons.person_outline_rounded,
                  title: 'Actualiza tu perfil',
                  body: 'Agrega una foto para personalizar tu cuenta.',
                  time: 'Hace 5 días',
                  unread: false,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 0),
    );
  }
}

/// 30 Notificaciones · leídas (891:725)
class P30NotificationsReadScreen extends StatelessWidget {
  const P30NotificationsReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Notificaciones'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              children: const [
                Align(
                  alignment: Alignment.centerRight,
                  child: PecoxStatusBadge.active('Todo al día'),
                ),
                SizedBox(height: 12),
                _NotificationCard(
                  icon: Icons.stars_rounded,
                  title: 'Tienes puntos por canjear',
                  body: '200 pts acumulados. Revisa las recompensas.',
                  time: 'Hace 5 min',
                  unread: false,
                ),
                SizedBox(height: 10),
                _NotificationCard(
                  icon: Icons.location_on_rounded,
                  title: 'Estación cercana activa',
                  body:
                      'Estación El Porvenir · Santa Aurora a 400 m. Recibe botellas PET de 500 ml.',
                  time: 'Hace 2 h',
                  unread: false,
                ),
                SizedBox(height: 10),
                _NotificationCard(
                  icon: Icons.local_fire_department_rounded,
                  title: 'No pierdas tu racha',
                  body: 'Llevas 4 días seguidos. Recicla hoy para mantenerla.',
                  time: 'Hace 4 h',
                  unread: false,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 0),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({
    required this.icon,
    required this.title,
    required this.body,
    required this.time,
    required this.unread,
  });

  final IconData icon;
  final String title;
  final String body;
  final String time;
  final bool unread;

  @override
  Widget build(BuildContext context) {
    return PecoxSurfaceCard(
      gradient: unread ? AppGradients.mintSurfaceGradient : null,
      borderColor: unread ? AppColors.borderSage : AppColors.borderLight,
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: unread ? AppColors.white : AppColors.pointsCard,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: AppColors.green),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.navy,
                        ),
                      ),
                    ),
                    if (unread)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.statusActive,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppColors.grayText,
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

/// 31 Logros y ranking (891:759)
class P31AchievementsScreen extends StatelessWidget {
  const P31AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Logros y ranking'),
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
                            Expanded(
                              child: Text(
                                'Eco Básico · Nivel 1 de 5',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.emoji_events_rounded,
                              color: AppColors.mint,
                              size: 26,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Próximo nivel: Eco Pro (50% completado)',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.mint,
                          ),
                        ),
                        const SizedBox(height: 14),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadii.pill),
                          child: LinearProgressIndicator(
                            value: 0.5,
                            minHeight: 8,
                            backgroundColor:
                                AppColors.white.withValues(alpha: 0.22),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.mint,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'LOGROS (2/5)',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _SimpleInfoCard(
                    icon: Icons.verified_rounded,
                    title: 'Primer reciclaje PET',
                    subtitle: 'Completaste tu primer depósito en estación',
                  ),
                  const SizedBox(height: 10),
                  const _SimpleInfoCard(
                    icon: Icons.local_drink_rounded,
                    title: '10 botellas PET',
                    subtitle: 'Validaste diez botellas de 500 ml',
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'RANKING · EL PORVENIR',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _SimpleInfoCard(
                    icon: Icons.looks_one_rounded,
                    title: '1. María C.',
                    subtitle: '48 kg reciclados · 960 pts',
                  ),
                  const SizedBox(height: 10),
                  const _SimpleInfoCard(
                    icon: Icons.looks_two_rounded,
                    title: '2. Luis G. (Tú)',
                    subtitle: '10 kg reciclados · 200 pts',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 4),
    );
  }
}

/// 32 Educación ambiental (891:799)
class P32EnvironmentalEdScreen extends StatefulWidget {
  const P32EnvironmentalEdScreen({super.key});

  @override
  State<P32EnvironmentalEdScreen> createState() =>
      _P32EnvironmentalEdScreenState();
}

class _P32EnvironmentalEdScreenState extends State<P32EnvironmentalEdScreen> {
  int _filterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: Column(
        children: [
          const P2Header(title: 'Educación ambiental'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  P2FilterChips(
                    labels: const ['Todos', 'PET 500 ml', 'Estación'],
                    selectedIndex: _filterIndex,
                    onSelected: (i) => setState(() => _filterIndex = i),
                  ),
                  const SizedBox(height: 16),
                  PecoxSurfaceCard(
                    gradient: AppGradients.mintSurfaceGradient,
                    borderColor: AppColors.borderSage,
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.lightbulb_rounded,
                              size: 18,
                              color: AppColors.green,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '¿SABÍAS QUE...?',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.6,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Una botella PET de 500 ml reciclada puede transformarse en fibra textil o nuevos envases, evitando que tarde más de 400 años en degradarse.',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            height: 1.45,
                            color: AppColors.navy,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'TIPS PARA TU BOTELLA PET 500 ML',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _SimpleInfoCard(
                    icon: Icons.water_drop_outlined,
                    title: 'Vacía por completo la botella',
                    subtitle:
                        'La estación mide el peso exacto de una botella PET de 500 ml sin líquido.',
                  ),
                  const SizedBox(height: 10),
                  const _SimpleInfoCard(
                    icon: Icons.local_drink_rounded,
                    title: 'Entrégala limpia y seca',
                    subtitle:
                        'Facilita la validación óptica y mantiene limpio el acopio.',
                  ),
                  const SizedBox(height: 10),
                  const _SimpleInfoCard(
                    icon: Icons.qr_code_scanner_rounded,
                    title: 'Reclama tu ticket QR',
                    subtitle:
                        'Presiona "Recibir QR" en la estación para acreditar tus +50 pts.',
                  ),
                  const SizedBox(height: 20),
                  GcPillButton(
                    label: 'Ir al Centro de Conocimiento PECOX',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStatePublic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcCitizenBottomNav(currentIndex: 4),
    );
  }
}

class _SimpleInfoCard extends StatelessWidget {
  const _SimpleInfoCard({
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
            width: 38,
            height: 38,
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
                const SizedBox(height: 3),
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
