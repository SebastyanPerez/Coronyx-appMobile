import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/gc_pill_button.dart';
import '../../../shared/widgets/p2_common_widgets.dart';

class _BrandBadge extends StatelessWidget {
  const _BrandBadge({required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: AppColors.mint,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '✓',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.green,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'PECOX',
          style: GoogleFonts.montserrat(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.green,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.muted,
          ),
        ),
      ],
    );
  }
}

/// 01 Login mejorado (886:592)
class P01LoginScreen extends StatelessWidget {
  const P01LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(36, 12, 36, 24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
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
              ),
              const _BrandBadge(subtitle: 'Inicia sesión para continuar'),
              const SizedBox(height: 36),
              const P2FormField(
                label: 'CORREO ELECTRÓNICO',
                initialValue: 'ejemplo@correo.com',
              ),
              const SizedBox(height: 16),
              const P2FormField(
                label: 'CONTRASEÑA',
                initialValue: '••••••••',
                obscureText: true,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRoutes.p03RecoverPassword,
                  ),
                  child: Text(
                    '¿Olvidaste tu contraseña?',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GcPillButton(
                label: 'Iniciar sesión',
                isPrimary: true,
                onPressed: () => Navigator.of(context).pushReplacementNamed(
                  AppRoutes.p09Home,
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  AppRoutes.p02LoginError,
                ),
                child: Text(
                  'Ver estado de error de login',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.muted,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'o continuar con',
                style: GoogleFonts.inter(fontSize: 12, color: AppColors.muted),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: GcPillButton(
                      label: 'Google',
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed(
                        AppRoutes.p09Home,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: GcPillButton(
                      label: 'Facebook',
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed(
                        AppRoutes.p09Home,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No tienes cuenta? ',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.muted,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.p05RegisterPersonal,
                    ),
                    child: Text(
                      'Regístrate',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 02 Login · error y bloqueo (886:614)
class P02LoginErrorScreen extends StatelessWidget {
  const P02LoginErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(36, 20, 36, 24),
          child: Column(
            children: [
              const _BrandBadge(subtitle: 'Verifica tus datos'),
              const SizedBox(height: 36),
              const P2FormField(
                label: 'CORREO ELECTRÓNICO',
                initialValue: 'luis@pecox.app',
              ),
              const SizedBox(height: 16),
              const P2FormField(
                label: 'CONTRASEÑA',
                initialValue: 'Contraseña incorrecta',
                isError: true,
                helperText: 'Te quedan 2 intentos antes del bloqueo temporal.',
              ),
              const SizedBox(height: 28),
              GcPillButton(
                label: 'Volver a intentar',
                isPrimary: true,
                onPressed: () => Navigator.of(context).pushReplacementNamed(
                  AppRoutes.p01Login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 03 Recuperar contraseña (886:629)
class P03RecoverPasswordScreen extends StatelessWidget {
  const P03RecoverPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Recuperar contraseña'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(36, 36, 36, 24),
              child: Column(
                children: [
                  Text(
                    '@',
                    style: GoogleFonts.montserrat(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Recupera el acceso',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Ingresa el correo asociado a tu cuenta y enviaremos un enlace seguro.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 28),
                  const P2FormField(
                    label: 'CORREO ELECTRÓNICO',
                    initialValue: 'correo@ejemplo.com',
                  ),
                  const SizedBox(height: 28),
                  GcPillButton(
                    label: 'Enviar enlace',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p04LinkSent,
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

/// 04 Enlace enviado (886:642)
class P04LinkSentScreen extends StatelessWidget {
  const P04LinkSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Revisa tu correo'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(36, 48, 36, 24),
              child: Column(
                children: [
                  Text(
                    '✓',
                    style: GoogleFonts.montserrat(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Enlace enviado',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Enviamos las instrucciones a luis@pecox.app. El enlace vence en 15 minutos.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 36),
                  GcPillButton(
                    label: 'Volver a iniciar sesión',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.p01Login,
                    ),
                  ),
                  const SizedBox(height: 14),
                  GcPillButton(
                    label: 'Reenviar correo',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Correo reenviado')),
                      );
                    },
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

/// 05 Registro · datos personales (886:654)
class P05RegisterPersonalScreen extends StatelessWidget {
  const P05RegisterPersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Crear cuenta'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(26, 12, 26, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paso 1 de 2',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const LinearProgressIndicator(
                      value: 0.5,
                      minHeight: 6,
                      backgroundColor: AppColors.borderLight,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.green),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const P2FormField(
                    label: 'NOMBRE COMPLETO',
                    initialValue: 'Luis Gamboa',
                  ),
                  const SizedBox(height: 16),
                  const P2FormField(
                    label: 'TIPO DE DOCUMENTO',
                    initialValue: 'DNI',
                    trailingText: '⌄',
                  ),
                  const SizedBox(height: 16),
                  const P2FormField(
                    label: 'NÚMERO DE DOCUMENTO',
                    initialValue: '12345678',
                    helperText: 'El DNI debe contener 8 dígitos.',
                  ),
                  const SizedBox(height: 16),
                  const P2FormField(
                    label: 'CORREO ELECTRÓNICO',
                    initialValue: 'luis@pecox.app',
                  ),
                  const SizedBox(height: 28),
                  GcPillButton(
                    label: 'Continuar',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p06RegisterSecurity,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                        AppRoutes.p07RegisterValidation,
                      ),
                      child: Text(
                        'Ver estado de validación específica (07)',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.muted,
                        ),
                      ),
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

/// 06 Registro · seguridad (886:678)
class P06RegisterSecurityScreen extends StatefulWidget {
  const P06RegisterSecurityScreen({super.key});

  @override
  State<P06RegisterSecurityScreen> createState() =>
      _P06RegisterSecurityScreenState();
}

class _P06RegisterSecurityScreenState extends State<P06RegisterSecurityScreen> {
  bool _accepted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Protege tu cuenta'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(26, 12, 26, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paso 2 de 2',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const LinearProgressIndicator(
                      value: 1.0,
                      minHeight: 6,
                      backgroundColor: AppColors.borderLight,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.green),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const P2FormField(
                    label: 'CONTRASEÑA',
                    initialValue: '••••••••',
                    obscureText: true,
                    helperText:
                        'Mínimo 8 caracteres, una mayúscula y un número.',
                  ),
                  const SizedBox(height: 16),
                  const P2FormField(
                    label: 'CONFIRMAR CONTRASEÑA',
                    initialValue: '••••••••',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => setState(() => _accepted = !_accepted),
                    child: Row(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color:
                                _accepted ? AppColors.green : AppColors.white,
                            border: Border.all(color: AppColors.green),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.center,
                          child: _accepted
                              ? const Text(
                                  '✓',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 13,
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Acepto los Términos y Condiciones y la Política de Privacidad.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.muted,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  GcPillButton(
                    label: 'Crear cuenta',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.p08RegisterSuccess,
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

/// 07 Registro · validación específica (886:698)
class P07RegisterValidationScreen extends StatelessWidget {
  const P07RegisterValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const P2Header(title: 'Corrige los datos'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(36, 16, 36, 24),
              child: Column(
                children: [
                  const P2FormField(
                    label: 'TIPO DE DOCUMENTO',
                    initialValue: 'DNI',
                  ),
                  const SizedBox(height: 16),
                  const P2FormField(
                    label: 'NÚMERO DE DOCUMENTO',
                    initialValue: '1234',
                    isError: true,
                    helperText: 'Ingresa exactamente 8 dígitos para DNI.',
                  ),
                  const SizedBox(height: 16),
                  const P2FormField(
                    label: 'CORREO ELECTRÓNICO',
                    initialValue: 'luis@pecox',
                    isError: true,
                    helperText:
                        'Ingresa un correo válido, por ejemplo nombre@dominio.com.',
                  ),
                  const SizedBox(height: 16),
                  const P2FormField(
                    label: 'CONFIRMAR CONTRASEÑA',
                    initialValue: 'Las contraseñas no coinciden',
                    isError: true,
                  ),
                  const SizedBox(height: 28),
                  GcPillButton(
                    label: 'Revisar y continuar',
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      AppRoutes.p05RegisterPersonal,
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

/// 08 Registro exitoso (886:719)
class P08RegisterSuccessScreen extends StatelessWidget {
  const P08RegisterSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '✓',
                style: GoogleFonts.montserrat(
                  fontSize: 56,
                  fontWeight: FontWeight.w700,
                  color: AppColors.green,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '¡Cuenta creada!',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Tu perfil de PECOX está listo. Ya puedes registrar reciclajes y acumular puntos.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 36),
              GcPillButton(
                label: 'Continuar al inicio',
                isPrimary: true,
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
