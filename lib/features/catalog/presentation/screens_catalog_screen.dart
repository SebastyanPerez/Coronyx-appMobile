import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/gc_header.dart';

class _ScreenItem {
  const _ScreenItem(this.title, this.subtitle, this.route);

  final String title;
  final String subtitle;
  final String route;
}

/// Catálogo interactivo para saltar a cualquiera de las 52 pantallas de Figma.
class ScreensCatalogScreen extends StatelessWidget {
  const ScreensCatalogScreen({super.key});

  static const _page2Screens = [
    _ScreenItem('01 Login mejorado', 'Autenticación principal', AppRoutes.p01Login),
    _ScreenItem('02 Login · error y bloqueo', 'Validación de credenciales', AppRoutes.p02LoginError),
    _ScreenItem('03 Recuperar contraseña', 'Envío de enlace por correo', AppRoutes.p03RecoverPassword),
    _ScreenItem('04 Enlace enviado', 'Confirmación de correo enviado', AppRoutes.p04LinkSent),
    _ScreenItem('05 Registro · datos personales', 'Paso 1 de 2', AppRoutes.p05RegisterPersonal),
    _ScreenItem('06 Registro · seguridad', 'Paso 2 de 2', AppRoutes.p06RegisterSecurity),
    _ScreenItem('07 Registro · validación específica', 'Errores de DNI, correo y clave', AppRoutes.p07RegisterValidation),
    _ScreenItem('08 Registro exitoso', 'Confirmación de cuenta creada', AppRoutes.p08RegisterSuccess),
    _ScreenItem('09 Inicio mejorado', 'Dashboard con puntos y accesos', AppRoutes.p09Home),
    _ScreenItem('10 Mapa mejorado', 'Puntos de reciclaje por material', AppRoutes.p10Map),
    _ScreenItem('11 Detalle del punto', 'Estación El Porvenir · horarios y PET 500 ml', AppRoutes.p11PointDetail),
    _ScreenItem('12 Escáner QR', 'Lectura de contenedor', AppRoutes.p12ScanQr),
    _ScreenItem('13 QR · validando entrega', 'Estado procesando QR', AppRoutes.p13QrValidating),
    _ScreenItem('14 QR · error recuperable', 'Código no válido o ya utilizado', AppRoutes.p14QrError),
    _ScreenItem('15 Reciclaje registrado', '+50 pts y racha actualizada', AppRoutes.p15RecyclingRegistered),
    _ScreenItem('16 Escanear producto', 'Detección de material por cámara', AppRoutes.p16ScanProduct),
    _ScreenItem('17 Producto · ayuda de detección', 'Recomendaciones de iluminación', AppRoutes.p17ProductHelp),
    _ScreenItem('18 Resultado del producto', 'Botella PET · Reciclable Tipo 1', AppRoutes.p18ProductResult),
    _ScreenItem('19 Recompensas mejoradas', 'Catálogo de premios por categoría', AppRoutes.p19Rewards),
    _ScreenItem('20 Detalle del premio', 'Detergente Multiusos · 80 pts', AppRoutes.p20RewardDetail),
    _ScreenItem('21 Confirmar canje', 'Modal de confirmación', AppRoutes.p21ConfirmRedeem),
    _ScreenItem('22 Procesando canje', 'Estado reservando premio', AppRoutes.p22ProcessingRedeem),
    _ScreenItem('23 Canje realizado', 'Código PCX-8042 generado', AppRoutes.p23RedeemSuccess),
    _ScreenItem('24 Saldo insuficiente', 'Aviso de puntos faltantes', AppRoutes.p24InsufficientBalance),
    _ScreenItem('25 Mis canjes', 'Historial de activos, utilizados y vencidos', AppRoutes.p25MyRedemptions),
    _ScreenItem('26 Perfil mejorado', 'Estadísticas, ajustes y acceso a GC', AppRoutes.p26Profile),
    _ScreenItem('27 Editar perfil', 'Actualización de datos del usuario', AppRoutes.p27EditProfile),
    _ScreenItem('28 Confirmar cierre de sesión', 'Modal de salida de cuenta', AppRoutes.p28ConfirmLogout),
    _ScreenItem('29 Notificaciones · no leídas', 'Avisos recientes con indicador', AppRoutes.p29NotificationsUnread),
    _ScreenItem('30 Notificaciones · leídas', 'Estado todo leído', AppRoutes.p30NotificationsRead),
    _ScreenItem('31 Logros y ranking', 'Nivel Eco Básico y tabla de Trujillo', AppRoutes.p31Achievements),
    _ScreenItem('32 Educación ambiental', 'Tips y datos de impacto', AppRoutes.p32EnvironmentalEd),
  ];

  static const _gcMainScreens = [
    _ScreenItem('GC 01 Centro de conocimiento', 'Biblioteca principal del equipo', AppRoutes.gc01Center),
    _ScreenItem('GC 02 Ficha de conocimiento', 'Criterios para recibir PET (MAT-PET-01)', AppRoutes.gc02Sheet),
    _ScreenItem('GC 03 Registrar y revisar experiencia', 'Formulario de borrador INC-004', AppRoutes.gc03RegisterExperience),
    _ScreenItem('GC 04 Mapa de conocimiento', 'Directorio de expertos por área', AppRoutes.gc04KnowledgeMap),
    _ScreenItem('GC 05 Usuarios y permisos', 'Gestión de roles por TI', AppRoutes.gc05UsersPermissions),
    _ScreenItem('GC 06 Indicadores y reportes', 'KPIs del Piloto El Porvenir', AppRoutes.gc06IndicatorsReports),
  ];

  static const _gcStateScreens = [
    _ScreenItem('GC Estado / pendientes', 'Bandeja de Rosa Huamán (1 pendiente)', AppRoutes.gcStatePending),
    _ScreenItem('GC Estado / Revisar experiencia', 'Aprobar y publicar experiencia', AppRoutes.gcStateReviewExperience),
    _ScreenItem('GC Estado / leccion', 'LL-MAN-004 · Resolver atasco de recepción', AppRoutes.gcStateLesson),
    _ScreenItem('GC Estado / experta', 'Perfil de responsable: Rosa Huamán', AppRoutes.gcStateExpert),
    _ScreenItem('GC Estado / permisos', 'Perfil Colaboradora asignado', AppRoutes.gcStatePermissions),
    _ScreenItem('GC Estado / permisosRevision', 'Cambio a Revisora de mantenimiento', AppRoutes.gcStatePermissionsReview),
    _ScreenItem('GC Estado / Permisos guardados', 'Lista actualizada con rol Revisora', AppRoutes.gcStatePermissionsSaved),
    _ScreenItem('GC Estado / reporte', 'Resumen del periodo noviembre 2026', AppRoutes.gcStateReport),
    _ScreenItem('GC Estado / publico', 'Centro de conocimiento para vecinos', AppRoutes.gcStatePublic),
    _ScreenItem('GC Estado / loginEquipo', 'Acceso autorizado del personal PECOX', AppRoutes.gcStateTeamLogin),
    _ScreenItem('GC Estado / Ficha pública PET', 'Ficha PET con navegación ciudadana', AppRoutes.gcStatePublicPetSheet),
    _ScreenItem('GC Estado / busqueda', 'Resultados de búsqueda para «PET»', AppRoutes.gcStateSearch),
    _ScreenItem('GC Estado / faq', '¿Por qué se rechaza un artículo? (Equipo)', AppRoutes.gcStateFaq),
    _ScreenItem('GC Estado / Pregunta frecuente pública', '¿Por qué se rechaza un artículo? (Público)', AppRoutes.gcStatePublicFaq),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(
            title: 'Catálogo · 52 pantallas Figma',
            showCatalogButton: false,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
              children: [
                Text(
                  'PÁGINA 2 · 02 – VERSIÓN FINAL MEJORADA (32)',
                  style: AppTypography.pageEyebrow,
                ),
                const SizedBox(height: 10),
                ..._page2Screens.map((s) => _CatalogTile(item: s)),
                const SizedBox(height: 20),
                Text(
                  'PÁGINA 3 · GC GESTIÓN DEL CONOCIMIENTO (6)',
                  style: AppTypography.pageEyebrow,
                ),
                const SizedBox(height: 10),
                ..._gcMainScreens.map((s) => _CatalogTile(item: s)),
                const SizedBox(height: 20),
                Text(
                  'PÁGINA 3 · GC ESTADOS Y RECORRIDOS (14)',
                  style: AppTypography.pageEyebrow,
                ),
                const SizedBox(height: 10),
                ..._gcStateScreens.map((s) => _CatalogTile(item: s)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CatalogTile extends StatelessWidget {
  const _CatalogTile({required this.item});

  final _ScreenItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: AppColors.soft,
        borderRadius: BorderRadius.circular(AppRadii.md),
        child: InkWell(
          onTap: () => Navigator.of(context).pushReplacementNamed(item.route),
          borderRadius: BorderRadius.circular(AppRadii.md),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: AppTypography.cardTitle),
                      const SizedBox(height: 2),
                      Text(item.subtitle, style: AppTypography.cardDetail),
                    ],
                  ),
                ),
                Text('Ir →', style: AppTypography.boxTitle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
