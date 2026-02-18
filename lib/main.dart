import 'package:da_ry_invitation/page/wedding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy(); // remove #
  runApp(const WeddingApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WeddingPage()),
    GoRoute(
      path: '/guest/:name',
      builder: (context, state) {
        final name = state.pathParameters['name'] ?? '';
        return WeddingPage(guestName: name);
      },
    ),
  ],
);

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: const [
          Breakpoint(start: 0, end: 600, name: MOBILE),
          Breakpoint(start: 601, end: 1024, name: TABLET),
          Breakpoint(start: 1025, end: double.infinity, name: DESKTOP),
        ],
      ),
    );
  }
}
