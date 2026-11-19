import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/gc_bottom_nav.dart';
import '../../../shared/widgets/gc_pill_button.dart';
import '../../../shared/widgets/p2_common_widgets.dart';

/// 26 Perfil mejorado (891:592) + Acceso a Centro de Conocimiento (GC)
class P26ProfileScreen extends StatelessWidget {
  const P26ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Mi perfil', showBack: false),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: AppColors.mint,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'LG',
                      style: GoogleFonts.montserrat(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Luis Gamboa',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'luis@pecox.app · DNI ••••5678',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.softAlt,
                      border: Border.all(color: AppColors.borderSage),
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: _ProfileStatItem(
                            value: '200',
                            label: 'PUNTOS',
                          ),
                        ),
                        Expanded(
                          child: _ProfileStatItem(
                            value: '10 kg',
                            label: 'RECICLADOS',
                          ),
                        ),
                        Expanded(
                          child: _ProfileStatItem(
                            value: '5 kg',
                            label: 'CO₂',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _ProfileMenuTile(
                    label: 'Centro de conocimiento PECOX (GC)',
                    isHighlighted: true,
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStatePublic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ProfileMenuTile(
                    label: 'Editar perfil',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p27EditProfile,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ProfileMenuTile(
                    label: 'Mis canjes',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p25MyRedemptions,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ProfileMenuTile(
                    label: 'Logros y ranking',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p31Achievements,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ProfileMenuTile(
                    label: 'Educación ambiental',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p32EnvironmentalEd,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _ProfileMenuTile(
                    label: 'Cerrar sesión',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p28ConfirmLogout,
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

class _ProfileStatItem extends StatelessWidget {
  const _ProfileStatItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.green,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.muted,
          ),
        ),
      ],
    );
  }
}

class _ProfileMenuTile extends StatelessWidget {
  const _ProfileMenuTile({
    required this.label,
    required this.onTap,
    this.isHighlighted = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isHighlighted ? AppColors.pointsCard : AppColors.white,
      borderRadius: BorderRadius.circular(AppRadii.lg),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        child: Container(
          width: double.infinity,
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderSage),
            borderRadius: BorderRadius.circular(AppRadii.lg),
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isHighlighted ? AppColors.green : AppColors.navy,
                  ),
                ),
              ),
              Text(
                '›',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.green,
                ),
              ),
            ],
          ),
        ),
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
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Editar perfil'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(36, 12, 36, 24),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppColors.mint,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'LG',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Cambiar foto',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const P2FormField(
                    label: 'NOMBRE COMPLETO',
                    initialValue: 'Luis Gamboa',
                  ),
                  const SizedBox(height: 16),
                  const P2FormField(
                    label: 'CORREO ELECTRÓNICO',
                    initialValue: 'luis@pecox.app',
                  ),
                  const SizedBox(height: 16),
                  const P2FormField(
                    label: 'TIPO DE DOCUMENTO',
                    initialValue: 'DNI',
                  ),
                  const SizedBox(height: 16),
                  const P2FormField(
                    label: 'NÚMERO DE DOCUMENTO',
                    initialValue: '••••5678',
                  ),
                  const SizedBox(height: 28),
                  GcPillButton(
                    label: 'Guardar cambios',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pop(),
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
                    '?',
                    style: GoogleFonts.montserrat(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green,
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
                  const SizedBox(height: 12),
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
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          P2Header(
            title: 'Notificaciones',
            trailing: InkWell(
              onTap: () => Navigator.of(context).pushReplacementNamed(
                AppRoutes.p30NotificationsRead,
              ),
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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
              children: const [
                _NotificationCard(
                  title: 'Tienes puntos por canjear',
                  body: '200 pts acumulados. Revisa las recompensas.',
                  time: 'Hace 5 min',
                  unread: true,
                ),
                SizedBox(height: 12),
                _NotificationCard(
                  title: 'Estación cercana activa',
                  body:
                      'Estación El Porvenir · Santa Aurora a 400 m. Recibe PET vacío 500 ml.',
                  time: 'Hace 2 h',
                  unread: true,
                ),
                SizedBox(height: 12),
                _NotificationCard(
                  title: 'No pierdas tu racha',
                  body: 'Llevas 4 días seguidos. Recicla hoy para mantenerla.',
                  time: 'Hace 4 h',
                  unread: true,
                ),
                SizedBox(height: 12),
                _NotificationCard(
                  title: 'Nueva recompensa disponible',
                  body: 'Se agregó un nuevo premio a Abarrotes.',
                  time: 'Hace 3 días',
                  unread: false,
                ),
                SizedBox(height: 12),
                _NotificationCard(
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
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Notificaciones'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'TODO LEÍDO',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const _NotificationCard(
                  title: 'Tienes puntos por canjear',
                  body: '200 pts acumulados. Revisa las recompensas.',
                  time: 'Hace 5 min',
                  unread: false,
                ),
                const SizedBox(height: 12),
                const _NotificationCard(
                  title: 'Estación cercana activa',
                  body:
                      'Estación El Porvenir · Santa Aurora a 400 m. Recibe PET vacío 500 ml.',
                  time: 'Hace 2 h',
                  unread: false,
                ),
                const SizedBox(height: 12),
                const _NotificationCard(
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
    required this.title,
    required this.body,
    required this.time,
    required this.unread,
  });

  final String title;
  final String body;
  final String time;
  final bool unread;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: unread ? AppColors.softAlt : AppColors.white,
        border: Border.all(color: AppColors.borderSage),
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (unread) ...[
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
          ],
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
                const SizedBox(height: 4),
                Text(
                  body,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 8),
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
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Logros y ranking'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.pointsCard,
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Eco Básico · Nivel 1 de 5',
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.navy,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Próximo nivel: Eco Pro',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.muted,
                          ),
                        ),
                        const SizedBox(height: 14),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: const LinearProgressIndicator(
                            value: 0.5,
                            minHeight: 10,
                            backgroundColor: AppColors.white,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.green,
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
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _SimpleInfoCard(
                    title: 'Primer reciclaje',
                    subtitle: 'Completaste tu primer registro',
                  ),
                  const SizedBox(height: 10),
                  const _SimpleInfoCard(
                    title: '10 reciclajes',
                    subtitle: 'Reciclaste diez veces',
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'RANKING · TRUJILLO',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _SimpleInfoCard(
                    title: '1. María C.',
                    subtitle: '48 kg reciclados',
                  ),
                  const SizedBox(height: 10),
                  const _SimpleInfoCard(
                    title: '2. Luis G.',
                    subtitle: '10 kg reciclados',
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
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Educación ambiental'),
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
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.pointsCard,
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '¿SABÍAS QUE...?',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.green,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Reciclar una lata de aluminio ahorra energía suficiente para ver televisión durante 3 horas.',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            height: 1.4,
                            color: AppColors.navy,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'TIPS DE RECICLAJE',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _SimpleInfoCard(
                    title: 'Separa por material',
                    subtitle: 'PET vacío, aluminio y papel o cartón seco van separados.',
                  ),
                  const SizedBox(height: 10),
                  const _SimpleInfoCard(
                    title: 'Aplana las cajas',
                    subtitle: 'Facilita el transporte y el reciclaje.',
                  ),
                  const SizedBox(height: 10),
                  const _SimpleInfoCard(
                    title: 'Reduce el plástico',
                    subtitle: 'Utiliza bolsas y botellas reutilizables.',
                  ),
                  const SizedBox(height: 16),
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
  const _SimpleInfoCard({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

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
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.navy,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}
