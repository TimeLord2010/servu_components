import 'package:flutter/material.dart';

import 'serv_scaffold.dart';

class ServApp extends StatelessWidget {
  const ServApp({
    super.key,
    this.child,
    this.routerConfig,
  });

  final RouterConfig<Object>? routerConfig;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    const primary = Color.fromARGB(255, 255, 84, 175);
    var themeData = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: primary,
    );
    if (routerConfig != null) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        routerConfig: routerConfig,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: ServScaffold(child: child!),
    );
  }
}
