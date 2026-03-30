import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:deep_north/core/router/app_router.dart';
import 'package:deep_north/core/theme/app_theme.dart';
import 'package:deep_north/features/home/providers/destination_provider.dart';
import 'package:deep_north/features/home/providers/sensor_provider.dart';

void main() {
  testWidgets('app shell renders home content', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(430, 932);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DestinationProvider()),
          ChangeNotifierProvider(create: (_) => SensorProvider()),
        ],
        child: MaterialApp.router(
          title: 'DeepNorth',
          theme: buildAppTheme(),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Destinasi Populer'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
  });
}
