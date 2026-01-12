import 'package:go_router/go_router.dart';
import 'package:oliftrop/ui/screens/main_fragment.dart';
import 'package:oliftrop/ui/screens/splash_screen.dart';
import 'package:oliftrop/ui/widgets/journey_view_widget.dart';
import 'package:oliftrop/ui/widgets/skills_view_widget.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      // builder: (context, state) => SkillsViewWidget(),
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: "/porfilo",
      name: "porfilo",
      builder: (context, state) => MainFragment(),
    ),
  ],
);
