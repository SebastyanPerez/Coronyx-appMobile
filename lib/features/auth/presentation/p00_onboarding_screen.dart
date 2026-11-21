import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/gc_pill_button.dart';
import '../../../shared/widgets/pecox_surface_card.dart';

class _OnboardingSlide {
  const _OnboardingSlide({
    required this.icon,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String eyebrow;
  final String title;
  final String subtitle;
}

/// 00b Onboarding rápido de 3 pasos para vecinos de El Porvenir.
class P00OnboardingScreen extends StatefulWidget {
  const P00OnboardingScreen({super.key});

  @override
  State<P00OnboardingScreen> createState() => _P00OnboardingScreenState();
}

class _P00OnboardingScreenState extends State<P00OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  static const _slides = [
    _OnboardingSlide(
      icon: Icons.location_on_rounded,
      eyebrow: 'PASO 1 DE 3',
      title: 'Ubica la estación PECOX',
      subtitle:
          'Consulta en el mapa las estaciones activas en El Porvenir y verifica su estado en tiempo real.',
    ),
    _OnboardingSlide(
      icon: Icons.local_drink_rounded,
      eyebrow: 'PASO 2 DE 3',
      title: 'Deposita botellas PET 500 ml',
      subtitle:
          'Entrega botellas de plástico PET de 500 ml vacías y limpias. La máquina valida el peso al instante.',
    ),
    _OnboardingSlide(
      icon: Icons.qr_code_scanner_rounded,
      eyebrow: 'PASO 3 DE 3',
      title: 'Escanea tu QR y gana premios',
      subtitle:
          'Presiona "Recibir QR" en la estación, escanéalo con la app para sumar +50 pts y canjéalos.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.p01Login);
  }

  void _next() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutCubic,
      );
    } else {
      _goToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentPage == _slides.length - 1;

    return Scaffold(
      backgroundColor: AppColors.softAlt,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PECOX',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green,
                    ),
                  ),
                  TextButton(
                    onPressed: _goToLogin,
                    child: Text(
                      'Saltar',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.muted,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _slides.length,
                  onPageChanged: (i) => setState(() => _currentPage = i),
                  itemBuilder: (context, index) {
                    final slide = _slides[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PecoxSurfaceCard(
                          gradient: AppGradients.ecoWalletGradient,
                          borderColor: null,
                          borderRadius: 32,
                          padding: const EdgeInsets.all(36),
                          child: Icon(
                            slide.icon,
                            size: 84,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 36),
                        Text(
                          slide.eyebrow,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.9,
                            color: AppColors.green,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          slide.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.navy,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          slide.subtitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            height: 1.5,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_slides.length, (index) {
                  final active = index == _currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: active ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: active ? AppColors.green : AppColors.borderSage,
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              GcPillButton(
                label: isLast ? 'Comenzar' : 'Siguiente',
                isPrimary: true,
                onPressed: _next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
