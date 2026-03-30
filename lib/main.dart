import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deep_north/core/theme/app_theme.dart';
import 'package:deep_north/core/router/app_router.dart';
import 'package:deep_north/features/home/providers/destination_provider.dart';
import 'package:deep_north/features/home/providers/sensor_provider.dart';

void main() {
  runApp(
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
}
