import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../theme/colors.dart';
import '../serv_progress_indicator.dart';
import '../text/serv_text.dart';
import 'serv_button.dart';

class ServFilledButton extends StatelessWidget {
  const ServFilledButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor = kPrimary2,
    this.isLoading = false,
    this.padding,
  });

  final Widget child;
  final Color? backgroundColor;
  final FutureOr<void> Function()? onPressed;
  final bool isLoading;
  final EdgeInsets? padding;

  factory ServFilledButton.text({
    required String text,
    required void Function()? onPressed,
    Color? backgroundColor,
    bool? isLoading,
  }) {
    return ServFilledButton(
      onPressed: onPressed,
      isLoading: isLoading ?? false,
      backgroundColor: backgroundColor ?? kPrimary2,
      child: ServText(
        text,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ServButton(
      onPress: () async {
        if (isLoading) return;
        if (onPressed != null) await onPressed!();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: _padding,
        decoration: BoxDecoration(
          color: onPressed == null ? backgroundColor?.withOpacity(0.5) : backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: _borderRadius,
        ),
        child: _child,
      ),
    );
  }

  Widget get _child {
    return SizedBox(
      height: 25,
      width: isLoading ? 25 : null,
      child: switch (isLoading) {
        true => const ServProgressIndicator(center: false),
        false => child,
      },
    );
  }

  EdgeInsets get _padding {
    if (isLoading) {
      return const EdgeInsets.all(15);
    }
    if (padding != null) {
      return padding!;
    }
    return const EdgeInsets.symmetric(
      horizontal: 50,
      vertical: 15,
    );
  }

  BorderRadius get _borderRadius {
    if (isLoading) {
      return BorderRadius.circular(50);
    }

    return BorderRadius.circular(10);
  }
}
