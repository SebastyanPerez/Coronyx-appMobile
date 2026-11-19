/// Catálogo completo de las 52 pantallas (32 de "02 – Versión final mejorada"
/// + 20 de "GC Gestión del conocimiento" y "GC Estados y recorridos").
abstract final class AppRoutes {
  // Catálogo / Selector rápido de las 52 pantallas
  static const String catalog = '/catalogo';

  // --- PÁGINA 2: 02 – Versión final mejorada (32 pantallas) ---
  // Auth & Registro (01 - 08)
  static const String p01Login = '/p01-login';
  static const String p02LoginError = '/p02-login-error';
  static const String p03RecoverPassword = '/p03-recuperar-password';
  static const String p04LinkSent = '/p04-enlace-enviado';
  static const String p05RegisterPersonal = '/p05-registro-datos';
  static const String p06RegisterSecurity = '/p06-registro-seguridad';
  static const String p07RegisterValidation = '/p07-registro-validacion';
  static const String p08RegisterSuccess = '/p08-registro-exitoso';

  // Inicio & Mapa (09 - 11)
  static const String p09Home = '/p09-inicio';
  static const String p10Map = '/p10-mapa';
  static const String p11PointDetail = '/p11-detalle-punto';

  // Escaneo QR & Producto (12 - 18)
  static const String p12ScanQr = '/p12-escaner-qr';
  static const String p13QrValidating = '/p13-qr-validando';
  static const String p14QrError = '/p14-qr-error';
  static const String p15RecyclingRegistered = '/p15-reciclaje-registrado';
  static const String p16ScanProduct = '/p16-escanear-producto';
  static const String p17ProductHelp = '/p17-producto-ayuda';
  static const String p18ProductResult = '/p18-resultado-producto';

  // Recompensas & Canjes (19 - 25)
  static const String p19Rewards = '/p19-recompensas';
  static const String p20RewardDetail = '/p20-detalle-premio';
  static const String p21ConfirmRedeem = '/p21-confirmar-canje';
  static const String p22ProcessingRedeem = '/p22-procesando-canje';
  static const String p23RedeemSuccess = '/p23-canje-realizado';
  static const String p24InsufficientBalance = '/p24-saldo-insuficiente';
  static const String p25MyRedemptions = '/p25-mis-canjes';

  // Perfil, Notificaciones, Logros & Educación (26 - 32)
  static const String p26Profile = '/p26-perfil';
  static const String p27EditProfile = '/p27-editar-perfil';
  static const String p28ConfirmLogout = '/p28-confirmar-cierre';
  static const String p29NotificationsUnread = '/p29-notificaciones-no-leidas';
  static const String p30NotificationsRead = '/p30-notificaciones-leidas';
  static const String p31Achievements = '/p31-logros-ranking';
  static const String p32EnvironmentalEd = '/p32-educacion-ambiental';

  // --- PÁGINA 3: GC Gestión del conocimiento (6 vistas principales) ---
  static const String gc01Center = '/gc01-centro-conocimiento';
  static const String gc02Sheet = '/gc02-ficha-conocimiento';
  static const String gc03RegisterExperience = '/gc03-registrar-experiencia';
  static const String gc04KnowledgeMap = '/gc04-mapa-conocimiento';
  static const String gc05UsersPermissions = '/gc05-usuarios-permisos';
  static const String gc06IndicatorsReports = '/gc06-indicadores-reportes';

  // --- PÁGINA 3: GC Estados y recorridos (14 vistas de estados) ---
  static const String gcStatePending = '/gc-estado-pendientes';
  static const String gcStateReviewExperience = '/gc-estado-revisar-experiencia';
  static const String gcStateLesson = '/gc-estado-leccion';
  static const String gcStateExpert = '/gc-estado-experta';
  static const String gcStatePermissions = '/gc-estado-permisos';
  static const String gcStatePermissionsReview = '/gc-estado-permisos-revision';
  static const String gcStatePermissionsSaved = '/gc-estado-permisos-guardados';
  static const String gcStateReport = '/gc-estado-reporte';
  static const String gcStatePublic = '/gc-estado-publico';
  static const String gcStateTeamLogin = '/gc-estado-login-equipo';
  static const String gcStatePublicPetSheet = '/gc-estado-ficha-publica-pet';
  static const String gcStateSearch = '/gc-estado-busqueda';
  static const String gcStateFaq = '/gc-estado-faq';
  static const String gcStatePublicFaq = '/gc-estado-faq-publica';
}
