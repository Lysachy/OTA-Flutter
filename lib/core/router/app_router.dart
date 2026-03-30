import 'package:go_router/go_router.dart';
import 'package:deep_north/features/home/screens/home_screen.dart';
import 'package:deep_north/features/destinations/screens/destination_detail_screen.dart';
import 'package:deep_north/features/booking/screens/booking_screen.dart';
import 'package:deep_north/features/monitoring/screens/monitoring_screen.dart';
import 'package:deep_north/features/profile/screens/profile_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
    GoRoute(
        path: '/destinations',
        builder: (_, __) => const DestinationListScreen()),
    GoRoute(
      path: '/destinations/:id',
      builder: (ctx, state) =>
          DestinationDetailScreen(id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/booking/:id',
      builder: (ctx, state) =>
          BookingScreen(destinationId: state.pathParameters['id']!),
    ),
    GoRoute(
        path: '/monitoring', builder: (_, __) => const MonitoringScreen()),
    GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
  ],
);
