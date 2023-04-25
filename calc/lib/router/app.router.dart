import 'package:auto_route/auto_route.dart';
import 'app.router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SelectCalc.page, path: "/"),
    AutoRoute(page: HomeRoute.page, path: "/calcTutorial"),
    AutoRoute(page: SecondRoute.page, path: "/secondPage"),
    AutoRoute(page: ExampleMap.page, path: "/exampleMapPage"),
  ];
}
