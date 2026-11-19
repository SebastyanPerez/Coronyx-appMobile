import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/gc_bottom_nav.dart';
import '../../../shared/widgets/gc_header.dart';
import '../../../shared/widgets/gc_info_box.dart';
import '../../../shared/widgets/gc_knowledge_card.dart';
import '../../../shared/widgets/gc_pill_button.dart';

/// GC 01 Centro de conocimiento (1203:828)
class Gc01CenterScreen extends StatelessWidget {
  const Gc01CenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Conocimiento PECOX'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ESPACIO DEL EQUIPO', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 12),
                  Text(
                    'Conocimiento que se comparte',
                    style: AppTypography.pageTitle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Guías y experiencias para operar mejor.',
                    style: AppTypography.pageSubtitle,
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStateSearch,
                    ),
                    borderRadius: BorderRadius.circular(AppRadii.md),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.soft,
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(AppRadii.md),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/icon_search.svg',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Buscar material o procedimiento',
                              style: AppTypography.pageSubtitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _GcFilterTab(
                          label: 'Biblioteca',
                          isSelected: true,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _GcFilterTab(
                          label: 'Pendientes (1)',
                          isSelected: false,
                          onTap: () => Navigator.of(context).pushNamed(
                            AppRoutes.gcStatePending,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GcKnowledgeCard(
                    tipo: 'MATERIALES · APROBADA',
                    titulo: 'Criterios para recibir PET',
                    detalle: 'Andrea Vega · v1.2 · público',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gc02Sheet,
                    ),
                  ),
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
                  GcKnowledgeCard(
                    tipo: 'ATENCIÓN · PREGUNTA FRECUENTE',
                    titulo: '¿Por qué se rechaza un artículo?',
                    detalle: 'Equipo de atención · v1.0',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStateFaq,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Registrar una experiencia',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.gc03RegisterExperience,
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

/// GC 02 Ficha de conocimiento (1203:906)
class Gc02SheetScreen extends StatelessWidget {
  const Gc02SheetScreen({super.key});

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
                        _StepRow(
                          numLabel: '01',
                          text: 'Vacía por completo la botella.',
                        ),
                        const SizedBox(height: 10),
                        _StepRow(
                          numLabel: '02',
                          text: 'Entrégala limpia y seca.',
                        ),
                        const SizedBox(height: 10),
                        _StepRow(
                          numLabel: '03',
                          text: 'Introduce una pieza a la vez.',
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
                      AppRoutes.gc04KnowledgeMap,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Me fue útil',
                    isPrimary: true,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('¡Gracias por tu valoración!'),
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
      bottomNavigationBar: const GcTeamBottomNav(currentIndex: 0),
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({required this.numLabel, required this.text});

  final String numLabel;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 28,
          child: Text(numLabel, style: AppTypography.boxTitle),
        ),
        Expanded(child: Text(text, style: AppTypography.boxBody)),
      ],
    );
  }
}

/// GC 03 Registrar y revisar experiencia (1203:970)
class Gc03RegisterExperienceScreen extends StatelessWidget {
  const Gc03RegisterExperienceScreen({
    super.key,
    this.isReviewMode = false,
  });

  final bool isReviewMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Registrar experiencia'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BORRADOR · MANTENIMIENTO',
                    style: AppTypography.pageEyebrow,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Comparte lo que aprendiste',
                    style: AppTypography.pageTitle,
                  ),
                  const SizedBox(height: 12),
                  const _GcFieldBox(
                    label: 'TÍTULO',
                    value: 'Atasco por una botella con líquido',
                  ),
                  const SizedBox(height: 12),
                  const _GcFieldBox(
                    label: 'PROBLEMA Y CAUSA',
                    value:
                        'El ingreso se detuvo. Se encontró una botella con líquido en la recepción.',
                  ),
                  const SizedBox(height: 12),
                  const _GcFieldBox(
                    label: 'SOLUCIÓN APLICADA',
                    value:
                        'Se realizó la parada segura, se retiró el material y se comprobó la recuperación.',
                  ),
                  const SizedBox(height: 12),
                  const _GcFieldBox(
                    label: 'AUTOR Y FECHA',
                    value: 'Javier Salazar · 10 nov 2026',
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'EVIDENCIA ADJUNTA',
                    body: 'Foto de inspección · caso INC-004',
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Rosa Huamán revisará el caso antes de publicarlo.',
                    style: AppTypography.boxBody,
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: isReviewMode
                        ? 'Aprobar y publicar'
                        : 'Enviar a revisión',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      isReviewMode
                          ? AppRoutes.gcStateLesson
                          : AppRoutes.gcStatePending,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Guardar borrador',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Borrador guardado')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GcTeamBottomNav(currentIndex: 2),
    );
  }
}

class _GcFieldBox extends StatelessWidget {
  const _GcFieldBox({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.pageEyebrow),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppRadii.sm),
          ),
          child: Text(value, style: AppTypography.boxBody),
        ),
      ],
    );
  }
}

/// GC 04 Mapa de conocimiento (1203:1035)
class Gc04KnowledgeMapScreen extends StatelessWidget {
  const Gc04KnowledgeMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Mapa de conocimiento'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PERSONAS Y CAPACIDADES',
                    style: AppTypography.pageEyebrow,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Encuentra a quien sabe',
                    style: AppTypography.pageTitle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Responsables del conocimiento crítico.',
                    style: AppTypography.pageSubtitle,
                  ),
                  const SizedBox(height: 12),
                  GcKnowledgeCard(
                    tipo: 'COORDINACIÓN AMBIENTAL',
                    titulo: 'Andrea Vega',
                    detalle: 'Materiales admitidos y criterios de calidad',
                    iconAsset: 'assets/icons/icon_people.svg',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gc02Sheet,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcKnowledgeCard(
                    tipo: 'MANTENIMIENTO',
                    titulo: 'Rosa Huamán',
                    detalle: 'Atascos, limpieza y parada segura',
                    iconAsset: 'assets/icons/icon_people.svg',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStateExpert,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcKnowledgeCard(
                    tipo: 'TECNOLOGÍAS DE INFORMACIÓN',
                    titulo: 'Diego Paredes',
                    detalle: 'Integración, permisos y respaldos',
                    iconAsset: 'assets/icons/icon_people.svg',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gc05UsersPermissions,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GcKnowledgeCard(
                    tipo: 'OPERACIONES',
                    titulo: 'Javier Salazar',
                    detalle: 'Retiro de material, pesaje y conciliación',
                    iconAsset: 'assets/icons/icon_people.svg',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStateLesson,
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

/// GC 05 Usuarios y permisos (1203:1115)
class Gc05UsersPermissionsScreen extends StatelessWidget {
  const Gc05UsersPermissionsScreen({
    super.key,
    this.rosaRole = 'COLABORADORA · MANTENIMIENTO',
    this.rosaDetail = 'Consulta interna y registro de experiencias',
  });

  final String rosaRole;
  final String rosaDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Usuarios y permisos'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ACCESO RESTRINGIDO · TI',
                    style: AppTypography.pageEyebrow,
                  ),
                  const SizedBox(height: 12),
                  Text('Permisos por función', style: AppTypography.pageTitle),
                  const SizedBox(height: 12),
                  Text(
                    'Diego Paredes · administración de accesos',
                    style: AppTypography.pageSubtitle,
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'Cada persona, el acceso necesario',
                    body:
                        'El personal aporta experiencias. Los responsables autorizados revisan y publican.',
                  ),
                  const SizedBox(height: 12),
                  const GcKnowledgeCard(
                    tipo: 'REVISORA · MATERIALES',
                    titulo: 'Andrea Vega',
                    detalle: 'Consulta, revisión y aprobación en su área',
                    iconAsset: 'assets/icons/icon_shield.svg',
                  ),
                  const SizedBox(height: 12),
                  GcKnowledgeCard(
                    tipo: rosaRole,
                    titulo: 'Rosa Huamán',
                    detalle: rosaDetail,
                    iconAsset: 'assets/icons/icon_shield.svg',
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStatePermissions,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const GcKnowledgeCard(
                    tipo: 'ADMINISTRADOR DE ACCESOS',
                    titulo: 'Diego Paredes',
                    detalle: 'Cuentas, permisos y respaldo del sistema',
                    iconAsset: 'assets/icons/icon_shield.svg',
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: 'Acceso ciudadano',
                    body: 'Los vecinos solo consultan el contenido público.',
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

/// GC 06 Indicadores y reportes (1203:1186)
class Gc06IndicatorsReportsScreen extends StatelessWidget {
  const Gc06IndicatorsReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const GcHeader(title: 'Indicadores y reportes'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PILOTO EL PORVENIR', style: AppTypography.pageEyebrow),
                  const SizedBox(height: 10),
                  Text('Aprender para mejorar', style: AppTypography.pageTitle),
                  const SizedBox(height: 10),
                  Text(
                    'Noviembre 2026 · datos de ejemplo',
                    style: AppTypography.pageSubtitle,
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Expanded(
                        child: _GcKpiCard(
                          value: '33 %',
                          title: 'Conocimiento vigente',
                          subtitle: '10 de 30 unidades críticas',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _GcKpiCard(
                          value: '4',
                          title: 'Lecciones aprobadas',
                          subtitle: 'Publicadas en el periodo',
                        ),
                      ),
                    ],
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
                          '60 % de reutilización',
                          style: AppTypography.cardTitle,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '3 de 5 incidencias cerradas usaron una solución documentada.',
                          style: AppTypography.boxBody,
                        ),
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: const LinearProgressIndicator(
                            value: 0.6,
                            minHeight: 8,
                            backgroundColor: AppColors.soft,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const GcInfoBox(
                    title: '7 de 10 revisiones dentro del plazo',
                    body: 'Prioridad: revisar los 3 contenidos restantes.',
                  ),
                  const SizedBox(height: 12),
                  GcPillButton(
                    label: 'Preparar reporte del periodo',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.gcStateReport,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Los resultados se calculan con registros del periodo y conservan su evidencia.',
                    style: AppTypography.boxBody,
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

class _GcKpiCard extends StatelessWidget {
  const _GcKpiCard({
    required this.value,
    required this.title,
    required this.subtitle,
  });

  final String value;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.soft,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: AppTypography.pageTitle.copyWith(color: AppColors.green),
          ),
          const SizedBox(height: 8),
          Text(title, style: AppTypography.boxTitle),
          const SizedBox(height: 4),
          Text(subtitle, style: AppTypography.cardDetail),
        ],
      ),
    );
  }
}

class _GcFilterTab extends StatelessWidget {
  const _GcFilterTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? AppColors.mint : AppColors.white,
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
            style: AppTypography.filterLabel(isSelected: isSelected),
          ),
        ),
      ),
    );
  }
}
