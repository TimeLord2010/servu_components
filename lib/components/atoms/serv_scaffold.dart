import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class ServScaffold extends StatelessWidget {
  final Widget child;

  const ServScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: child,
    );
  }
}
