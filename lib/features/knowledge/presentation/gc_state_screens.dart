import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/gc_bottom_nav.dart';
import '../../../shared/widgets/gc_header.dart';
import '../../../shared/widgets/gc_info_box.dart';
import '../../../shared/widgets/gc_knowledge_card.dart';
import '../../../shared/widgets/gc_pill_button.dart';
import 'gc_main_screens.dart';

/// GC Estado / Revisar experiencia (1203:1315)
class GcStateReviewExperienceScreen extends StatelessWidget {
  const GcStateReviewExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Gc03RegisterExperienceScreen(isReviewMode: true);
  }
}

/// GC Estado / leccion (1203:1350)
class GcStateLessonScreen extends StatelessWidget {
  const GcStateLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Lección aprendida'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LL-MAN-004 · APROBADA', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 12),
                  Text(
                    'Resolver un atasco de recepción',
                    style: AppTypography.pageTitle,
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'VERSIÓN 1.1 · USO INTERNO',
                    body: 'Autor: Javier Salazar\n'
                        'Revisó: Rosa Huamán · 10 nov 2026',
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(AppRadii.md),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Problema', style: AppTypography.boxTitle),
                        const SizedBox(height: 4),
                        Text(
                          'La recepción se detuvo durante una entrega.',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 12),
                        Text('Causa', style: AppTypography.boxTitle),
                        const SizedBox(height: 4),
                        Text(
                          'Se encontró una botella que conservaba líquido.',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 12),
                        Text('Solución', style: AppTypography.boxTitle),
                        const SizedBox(height: 4),
                        Text(
                          'Se aplicó la parada segura, se retiró el material y se comprobó la recuperación.',
                          style: AppTypography.boxBody,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'Evidencia y aplicación',
                    body: 'INC-004 · foto de inspección\n'
                        'Aplicar el procedimiento vigente de seguridad.',
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Consultar a mantenimiento',
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStateExpert,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Volver a la biblioteca',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.gc01Center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcTeamBottomNav(currentIndex: 0),
    );
  }
}

/// GC Estado / experta (1203:1408)
class GcStateExpertScreen extends StatelessWidget {
  const GcStateExpertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Responsable del conocimiento'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('MANTENIMIENTO', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 12),
                  Text('Rosa Huamán', style: AppTypography.pageTitle),
                  const SizedBox(height: 12),
                  Text(
                    'Titular del conocimiento de mantenimiento.',
                    style: AppTypography.pageSubtitle,
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'QUÉ CONOCIMIENTO VALIDA',
                    body:
                        'Atascos, limpieza, parada segura y recuperación de la estación.',
                  ),
                  const SizedBox(height: 12),
                  Text('CONTENIDO RELACIONADO', style: AppTypography.boxTitle),
                  const SizedBox(height: 12),
                  GcKnowledgeCard(
                    tipo: 'MANTENIMIENTO · LECCIÓN',
                    titulo: 'Resolver un atasco de recepción',
                    detalle: 'Rosa Huamán · v1.0 · interno',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStateLesson,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'Cómo solicitar una revisión',
                    body:
                        'Registra el caso y su evidencia. La responsable revisará la experiencia antes de publicarla.',
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Registrar un caso para revisión',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.gc03RegisterExperience,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Volver al mapa de conocimiento',
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.gc04KnowledgeMap,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcTeamBottomNav(currentIndex: 1),
    );
  }
}

/// GC Estado / permisos (1203:1469) y GC Estado / permisosRevision (1203:1530)
class GcStatePermissionsScreen extends StatefulWidget {
  const GcStatePermissionsScreen({
    super.key,
    this.initialIsReviewer = false,
  });

  final bool initialIsReviewer;

  @override
  State<GcStatePermissionsScreen> createState() =>
      _GcStatePermissionsScreenState();
}

class _GcStatePermissionsScreenState extends State<GcStatePermissionsScreen> {
  late bool _isReviewer;

  @override
  void initState() {
    super.initState();
    _isReviewer = widget.initialIsReviewer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Editar permisos'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ADMINISTRACIÓN · TI', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 12),
                  Text('Rosa Huamán', style: AppTypography.pageTitle),
                  const SizedBox(height: 12),
                  Text(
                    'Área de mantenimiento · cuenta activa',
                    style: AppTypography.pageSubtitle,
                  ),
                  const SizedBox(height: 12),
                  Text('PERFIL DE ACCESO', style: AppTypography.boxTitle),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _RoleToggleBtn(
                          label: 'Colaboradora',
                          selected: !_isReviewer,
                          onTap: () => setState(() => _isReviewer = false),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _RoleToggleBtn(
                          label: 'Revisora',
                          selected: _isReviewer,
                          onTap: () => setState(() => _isReviewer = true),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GcInfoBox(
                    title: _isReviewer
                        ? 'REVISORA DE MANTENIMIENTO'
                        : 'COLABORADORA',
                    body: _isReviewer
                        ? 'Puede revisar y aprobar el contenido de su área.'
                        : 'Puede consultar contenido interno y registrar experiencias.',
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(AppRadii.md),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sí · consultar conocimiento interno',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Sí · registrar experiencias',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _isReviewer
                              ? 'Sí · aprobar en mantenimiento'
                              : 'No · aprobar publicaciones',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'No · administrar accesos',
                          style: AppTypography.boxBody,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _isReviewer
                        ? 'El cambio conserva el responsable, el área y la fecha de asignación.'
                        : 'Solo TI puede cambiar el perfil. La revisión se limita al área asignada.',
                    style: AppTypography.boxBody,
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Guardar permisos',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.gcStatePermissionsSaved,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Cancelar',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcTeamBottomNav(currentIndex: 3),
    );
  }
}

class _RoleToggleBtn extends StatelessWidget {
  const _RoleToggleBtn({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.mint : AppColors.white,
      borderRadius: BorderRadius.circular(AppRadii.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.sm),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppRadii.sm),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppTypography.filterLabel(isSelected: selected),
          ),
        ),
      ),
    );
  }
}

/// GC Estado / Permisos guardados (1203:1591)
class GcStatePermissionsSavedScreen extends StatelessWidget {
  const GcStatePermissionsSavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Gc05UsersPermissionsScreen(
      rosaRole: 'REVISORA · MANTENIMIENTO',
      rosaDetail: 'Consulta, revisión y aprobación en su área',
    );
  }
}

/// GC Estado / reporte (1203:1632)
class GcStateReportScreen extends StatelessWidget {
  const GcStateReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Reporte del periodo'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('REPORTE PARA REVISIÓN', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 12),
                  Text('Piloto El Porvenir', style: AppTypography.pageTitle),
                  const SizedBox(height: 12),
                  Text(
                    'Noviembre 2026 · datos de ejemplo',
                    style: AppTypography.pageSubtitle,
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'ESTACIÓN 01 · GESTIÓN DEL CONOCIMIENTO',
                    body: 'Periodo: 01 al 30 de noviembre de 2026',
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(AppRadii.md),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Conocimiento vigente: 10 de 30 (33 %)',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Lecciones aprobadas: 4',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Incidencias cerradas: 5',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Resueltas con conocimiento existente: 3',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Revisiones dentro del plazo: 7 de 10',
                          style: AppTypography.boxBody,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'Acción prioritaria',
                    body: 'Revisar los 3 contenidos que excedieron su plazo.',
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'El reporte resume los indicadores y debe contrastarse con sus registros de origen.',
                    style: AppTypography.boxBody,
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Volver al tablero',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.gc06IndicatorsReports,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcTeamBottomNav(currentIndex: 4),
    );
  }
}

/// GC Estado / publico (1203:1689)
class GcStatePublicScreen extends StatelessWidget {
  const GcStatePublicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Centro de conocimiento'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CONTENIDO PÚBLICO', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 12),
                  Text(
                    'Reciclar empieza por saber',
                    style: AppTypography.pageTitle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Guías aprobadas para los vecinos del piloto.',
                    style: AppTypography.pageSubtitle,
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'PILOTO EL PORVENIR',
                    body:
                        'PET vacío, aluminio y papel o cartón seco, según las condiciones de la estación.',
                  ),
                  const SizedBox(height: 12),
                  GcKnowledgeCard(
                    tipo: 'MATERIALES · APROBADA',
                    titulo: 'Criterios para recibir PET',
                    detalle: 'Preparación y condiciones de entrega',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStatePublicPetSheet,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcKnowledgeCard(
                    tipo: 'ATENCIÓN · PREGUNTA FRECUENTE',
                    titulo: '¿Por qué se rechaza un artículo?',
                    detalle: 'Consulta las condiciones antes de depositar',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStatePublicFaq,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Acceso del personal PECOX',
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStateTeamLogin,
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

/// GC Estado / loginEquipo (1203:1739)
class GcStateTeamLoginScreen extends StatelessWidget {
  const GcStateTeamLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Acceso del equipo'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PERSONAL AUTORIZADO', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 12),
                  Text('Ingresa a tu espacio', style: AppTypography.pageTitle),
                  const SizedBox(height: 12),
                  Text(
                    'Utiliza tu cuenta de PECOX.',
                    style: AppTypography.pageSubtitle,
                  ),
                  const SizedBox(height: 16),
                  Text('CORREO', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(AppRadii.sm),
                    ),
                    child: Text(
                      'Tu correo de PECOX',
                      style: AppTypography.boxBody,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text('CONTRASEÑA', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(AppRadii.sm),
                    ),
                    child: Text('••••••••', style: AppTypography.boxBody),
                  ),
                  const SizedBox(height: 16),
                  const GcInfoBox(
                    title: 'Permisos según tu función',
                    body:
                        'Consulta, aporte, revisión o administración de accesos.',
                  ),
                  const SizedBox(height: 16),
                  GcPillButton(
                    label: 'Entrar al espacio del equipo',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.gc01Center,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Volver a las guías públicas',
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.gcStatePublic,
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

/// GC Estado / Ficha pública PET (1203:1765)
class GcStatePublicPetSheetScreen extends StatelessWidget {
  const GcStatePublicPetSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Ficha de conocimiento'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('MAT-PET-01 · APROBADA', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 12),
                  Text(
                    'Criterios para recibir PET',
                    style: AppTypography.pageTitle,
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'VERSIÓN 1.2 · CONTENIDO PÚBLICO',
                    body: 'Responsable: Andrea Vega\n'
                        'Revisión: 10 nov 2026 · próxima: 10 dic 2026',
                  ),
                  const SizedBox(height: 12),
                  Text('ANTES DE DEPOSITAR', style: AppTypography.boxTitle),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(AppRadii.md),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '01  Vacía por completo la botella.',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '02  Entrégala limpia y seca.',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '03  Introduce una pieza a la vez.',
                          style: AppTypography.boxBody,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'Revisa los límites de la estación',
                    body:
                        'El tamaño y el estado del material deben cumplir la ficha vigente del piloto.',
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'Trazabilidad',
                    body: 'Fuente: criterios del piloto PECOX\n'
                        'Categoría: materiales y calidad\n'
                        'Estado anterior: versión 1.1 reemplazada',
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Ver responsable y conocimientos',
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStatePublicFaq,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Volver a la biblioteca',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
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

/// GC Estado / busqueda (1203:1848)
class GcStateSearchScreen extends StatelessWidget {
  const GcStateSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Buscar conocimiento'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('BIBLIOTECA DEL EQUIPO', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 12),
                  Text('Resultados para «PET»', style: AppTypography.pageTitle),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'BÚSQUEDA ACTIVA',
                    body: 'Materiales y calidad · contenido aprobado',
                  ),
                  const SizedBox(height: 12),
                  GcKnowledgeCard(
                    tipo: 'FICHA · APROBADA',
                    titulo: 'Criterios para recibir PET',
                    detalle: 'Andrea Vega · v1.2',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gc02Sheet,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Limpiar búsqueda',
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.gc01Center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcTeamBottomNav(currentIndex: 0),
    );
  }
}

/// GC Estado / faq (1203:1901) y GC Estado / Pregunta frecuente pública (1203:1956)
class GcStateFaqScreen extends StatelessWidget {
  const GcStateFaqScreen({
    super.key,
    this.isPublic = false,
  });

  final bool isPublic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Pregunta frecuente'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ATENCIÓN · CONTENIDO APROBADO',
                    style: AppTypography.pageEyebrow,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '¿Por qué se rechaza un artículo?',
                    style: AppTypography.pageTitle,
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'Antes de volver a intentarlo',
                    body:
                        'Consulta el motivo que muestra la estación. Un rechazo no genera puntos.',
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(AppRadii.md),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Material no admitido',
                          style: AppTypography.boxTitle,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'El piloto recibe PET vacío, aluminio y papel o cartón seco.',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Preparación inadecuada',
                          style: AppTypography.boxTitle,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Vacía los envases y sigue las condiciones de la ficha del material.',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Estación no disponible',
                          style: AppTypography.boxTitle,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Si hay una falla o el compartimento está lleno, espera la indicación del servicio.',
                          style: AppTypography.boxBody,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Consultar la ficha PET',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      isPublic
                          ? AppRoutes.gcStatePublicPetSheet
                          : AppRoutes.gc02Sheet,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Volver a la biblioteca',
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      isPublic ? AppRoutes.gcStatePublic : AppRoutes.gc01Center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isPublic
          ? const GcCitizenBottomNav(currentIndex: 4)
          : const GcTeamBottomNav(currentIndex: 0),
    );
  }
}
