// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:calc/screens/ExampleMap.dart' as _i4;
import 'package:calc/screens/Home.dart' as _i1;
import 'package:calc/screens/SecondPage.dart' as _i2;
import 'package:calc/screens/SelectCalc.dart' as _i3;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey]) : super();

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    SecondRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SecondPage(),
      );
    },
    SelectCalc.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectCalc(),
      );
    },
    ExampleMap.name: (routeData) {
      final args = routeData.argsAs<ExampleMapArgs>(
          orElse: () => const ExampleMapArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ExampleMap(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SecondPage]
class SecondRoute extends _i5.PageRouteInfo<void> {
  const SecondRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SecondRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecondRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SelectCalc]
class SelectCalc extends _i5.PageRouteInfo<void> {
  const SelectCalc({List<_i5.PageRouteInfo>? children})
      : super(
          SelectCalc.name,
          initialChildren: children,
        );

  static const String name = 'SelectCalc';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ExampleMap]
class ExampleMap extends _i5.PageRouteInfo<ExampleMapArgs> {
  ExampleMap({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ExampleMap.name,
          args: ExampleMapArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ExampleMap';

  static const _i5.PageInfo<ExampleMapArgs> page =
      _i5.PageInfo<ExampleMapArgs>(name);
}

class ExampleMapArgs {
  const ExampleMapArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'ExampleMapArgs{key: $key}';
  }
}
