import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pecox_iskey/app.dart';
import 'package:pecox_iskey/core/router/app_routes.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('Login screen renders and navigates to Home', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PecoxApp());

    expect(find.text('Inicia sesión para continuar'), findsOneWidget);
    expect(find.text('Iniciar sesión'), findsOneWidget);

    await tester.tap(find.text('Iniciar sesión'));
    await tester.pumpAndSettle();

    expect(find.text('Hola, Luis'), findsOneWidget);
    expect(find.text('ACCIONES RÁPIDAS'), findsOneWidget);
  });

  testWidgets('PendingReviewsScreen renders Figma content', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const PecoxApp(initialRoute: AppRoutes.gcStatePending),
    );

    expect(find.text('Pendientes de revisión'), findsOneWidget);
    expect(find.text('Una experiencia por revisar'), findsOneWidget);
    expect(find.text('Atasco por una botella con líquido'), findsOneWidget);
    expect(find.text('Volver a la biblioteca'), findsOneWidget);
  });

  testWidgets('Catalog lists 52 screens sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const PecoxApp(initialRoute: AppRoutes.catalog),
    );

    expect(find.text('Catálogo · 52 pantallas Figma'), findsOneWidget);
    expect(
      find.text('PÁGINA 2 · 02 – VERSIÓN FINAL MEJORADA (32)'),
      findsOneWidget,
    );
  });
}
