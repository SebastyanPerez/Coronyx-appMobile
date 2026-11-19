import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';

/// Encabezado superior de las pantallas de "02 – Versión final mejorada".
class P2Header extends StatelessWidget {
  const P2Header({
    super.key,
    required this.title,
    this.showBack = true,
    this.onBack,
    this.trailing,
  });

  final String title;
  final bool showBack;
  final VoidCallback? onBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 8),
        child: Row(
          children: [
            if (showBack) ...[
              InkWell(
                onTap: () {
                  if (onBack != null) {
                    onBack!();
                  } else if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pushReplacementNamed(
                      AppRoutes.p09Home,
                    );
                  }
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    '‹',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColors.navy,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
            ),
            if (trailing != null) ...[
              trailing!,
              const SizedBox(width: 8),
            ],
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.catalog),
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
          ],
        ),
      ),
    );
  }
}

/// Campo de formulario reutilizable para las pantallas de Login, Registro y Perfil.
class P2FormField extends StatelessWidget {
  const P2FormField({
    super.key,
    required this.label,
    required this.initialValue,
    this.helperText,
    this.isError = false,
    this.obscureText = false,
    this.trailingText,
  });

  final String label;
  final String initialValue;
  final String? helperText;
  final bool isError;
  final bool obscureText;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: isError ? const Color(0xFFB91C1C) : AppColors.borderSage,
            ),
            borderRadius: BorderRadius.circular(AppRadii.sm),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: initialValue,
                  obscureText: obscureText,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: isError
                        ? const Color(0xFFB91C1C)
                        : AppColors.grayText,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              if (trailingText != null)
                Text(
                  trailingText!,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: AppColors.muted,
                  ),
                ),
            ],
          ),
        ),
        if (helperText != null) ...[
          const SizedBox(height: 6),
          Text(
            helperText!,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: isError ? const Color(0xFFB91C1C) : AppColors.muted,
            ),
          ),
        ],
      ],
    );
  }
}

/// Chips de filtro horizontales para Mapa, Recompensas, Mis Canjes y Educación.
class P2FilterChips extends StatelessWidget {
  const P2FilterChips({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(labels.length, (index) {
          final isSelected = index == selectedIndex;
          return Padding(
            padding: EdgeInsets.only(right: index == labels.length - 1 ? 0 : 8),
            child: InkWell(
              onTap: () => onSelected(index),
              borderRadius: BorderRadius.circular(AppRadii.pill),
              child: Container(
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.green : AppColors.white,
                  border: isSelected
                      ? null
                      : Border.all(color: AppColors.borderSage),
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                ),
                alignment: Alignment.center,
                child: Text(
                  labels[index],
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? AppColors.white : AppColors.muted,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
