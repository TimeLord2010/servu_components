import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../text/serv_text.dart';

class ServButton extends StatelessWidget {
  const ServButton({
    super.key,
    required this.child,
    required this.onPress,
  });

  factory ServButton.text({
    required String text,
    required void Function() onPress,
    Color color = kPrimary2,
  }) {
    return ServButton(
      onPress: onPress,
      child: ServText(
        text,
        style: TextStyle(
          color: color,
          fontSize: 17,
        ),
      ),
    );
  }

  final Widget child;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPress,
        child: child,
      ),
    );
  }
}
