import 'package:material_ui/material_ui.dart';
import 'core/router/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/p00_onboarding_screen.dart';
import 'features/auth/presentation/p00_splash_screen.dart';
import 'features/auth/presentation/p2_auth_screens.dart';
import 'features/catalog/presentation/screens_catalog_screen.dart';
import 'features/home_map/presentation/p2_home_map_screens.dart';
import 'features/knowledge/presentation/gc_main_screens.dart';
import 'features/knowledge/presentation/gc_state_screens.dart';
import 'features/profile/presentation/p2_profile_screens.dart';
import 'features/review/presentation/pending_reviews_screen.dart';
import 'features/rewards/presentation/p2_rewards_screens.dart';
import 'features/scanner/presentation/p2_scanner_screens.dart';

class PecoxApp extends StatelessWidget {
  const PecoxApp({
    super.key,
    this.initialRoute = AppRoutes.splash,
  });

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PECOX',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: initialRoute,
      routes: {
        AppRoutes.splash: (_) => const P00SplashScreen(),
        AppRoutes.onboarding: (_) => const P00OnboardingScreen(),
        AppRoutes.catalog: (_) => const ScreensCatalogScreen(),
        // Página 2: 02 – Versión final mejorada (32 pantallas)
        AppRoutes.p01Login: (_) => const P01LoginScreen(),
        AppRoutes.p02LoginError: (_) => const P02LoginErrorScreen(),
        AppRoutes.p03RecoverPassword: (_) => const P03RecoverPasswordScreen(),
        AppRoutes.p04LinkSent: (_) => const P04LinkSentScreen(),
        AppRoutes.p05RegisterPersonal: (_) => const P05RegisterPersonalScreen(),
        AppRoutes.p06RegisterSecurity: (_) => const P06RegisterSecurityScreen(),
        AppRoutes.p07RegisterValidation: (_) =>
            const P07RegisterValidationScreen(),
        AppRoutes.p08RegisterSuccess: (_) => const P08RegisterSuccessScreen(),
        AppRoutes.p09Home: (_) => const P09HomeScreen(),
        AppRoutes.p10Map: (_) => const P10MapScreen(),
        AppRoutes.p11PointDetail: (_) => const P11PointDetailScreen(),
        AppRoutes.p12ScanQr: (_) => const P12ScanQrScreen(),
        AppRoutes.p13QrValidating: (_) => const P13QrValidatingScreen(),
        AppRoutes.p14QrError: (_) => const P14QrErrorScreen(),
        AppRoutes.p15RecyclingRegistered: (_) =>
            const P15RecyclingRegisteredScreen(),
        AppRoutes.p16ScanProduct: (_) => const P16ScanProductScreen(),
        AppRoutes.p17ProductHelp: (_) => const P17ProductHelpScreen(),
        AppRoutes.p18ProductResult: (_) => const P18ProductResultScreen(),
        AppRoutes.p19Rewards: (_) => const P19RewardsScreen(),
        AppRoutes.p20RewardDetail: (_) => const P20RewardDetailScreen(),
        AppRoutes.p21ConfirmRedeem: (_) => const P21ConfirmRedeemScreen(),
        AppRoutes.p22ProcessingRedeem: (_) => const P22ProcessingRedeemScreen(),
        AppRoutes.p23RedeemSuccess: (_) => const P23RedeemSuccessScreen(),
        AppRoutes.p24InsufficientBalance: (_) =>
            const P24InsufficientBalanceScreen(),
        AppRoutes.p25MyRedemptions: (_) => const P25MyRedemptionsScreen(),
        AppRoutes.p26Profile: (_) => const P26ProfileScreen(),
        AppRoutes.p27EditProfile: (_) => const P27EditProfileScreen(),
        AppRoutes.p28ConfirmLogout: (_) => const P28ConfirmLogoutScreen(),
        AppRoutes.p29NotificationsUnread: (_) =>
            const P29NotificationsUnreadScreen(),
        AppRoutes.p30NotificationsRead: (_) =>
            const P30NotificationsReadScreen(),
        AppRoutes.p31Achievements: (_) => const P31AchievementsScreen(),
        AppRoutes.p32EnvironmentalEd: (_) => const P32EnvironmentalEdScreen(),
        // Página 3: GC Gestión del conocimiento (6 vistas principales)
        AppRoutes.gc01Center: (_) => const Gc01CenterScreen(),
        AppRoutes.gc02Sheet: (_) => const Gc02SheetScreen(),
        AppRoutes.gc03RegisterExperience: (_) =>
            const Gc03RegisterExperienceScreen(),
        AppRoutes.gc04KnowledgeMap: (_) => const Gc04KnowledgeMapScreen(),
        AppRoutes.gc05UsersPermissions: (_) =>
            const Gc05UsersPermissionsScreen(),
        AppRoutes.gc06IndicatorsReports: (_) =>
            const Gc06IndicatorsReportsScreen(),
        // Página 3: GC Estados y recorridos (14 vistas de estado)
        AppRoutes.gcStatePending: (_) => const PendingReviewsScreen(),
        AppRoutes.gcStateReviewExperience: (_) =>
            const GcStateReviewExperienceScreen(),
        AppRoutes.gcStateLesson: (_) => const GcStateLessonScreen(),
        AppRoutes.gcStateExpert: (_) => const GcStateExpertScreen(),
        AppRoutes.gcStatePermissions: (_) => const GcStatePermissionsScreen(
              initialIsReviewer: false,
            ),
        AppRoutes.gcStatePermissionsReview: (_) =>
            const GcStatePermissionsScreen(
              initialIsReviewer: true,
            ),
        AppRoutes.gcStatePermissionsSaved: (_) =>
            const GcStatePermissionsSavedScreen(),
        AppRoutes.gcStateReport: (_) => const GcStateReportScreen(),
        AppRoutes.gcStatePublic: (_) => const GcStatePublicScreen(),
        AppRoutes.gcStateTeamLogin: (_) => const GcStateTeamLoginScreen(),
        AppRoutes.gcStatePublicPetSheet: (_) =>
            const GcStatePublicPetSheetScreen(),
        AppRoutes.gcStateSearch: (_) => const GcStateSearchScreen(),
        AppRoutes.gcStateFaq: (_) => const GcStateFaqScreen(isPublic: false),
        AppRoutes.gcStatePublicFaq: (_) =>
            const GcStateFaqScreen(isPublic: true),
      },
    );
  }
}
