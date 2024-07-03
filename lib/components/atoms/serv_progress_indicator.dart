import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class ServProgressIndicator extends StatelessWidget {
  const ServProgressIndicator({
    super.key,
    this.center = true,
  });

  final bool center;

  @override
  Widget build(BuildContext context) {
    var indicator = const CircularProgressIndicator(
      strokeWidth: 3,
      color: white,
    );
    if (!center) {
      return indicator;
    }
    return Center(
      child: indicator,
    );
  }
}
