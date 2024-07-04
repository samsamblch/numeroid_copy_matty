import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';

class _BaseContainer extends StatelessWidget {
  const _BaseContainer({
    required this.child,
    required this.color,
    required this.border,
    required this.shadow,
  });

  final Color color;
  final bool border;
  final bool shadow;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
        border: (border) ? Border.all(width: 1, color: Colors.grey) : null,
        boxShadow: (shadow)
            ? [
                const BoxShadow(
                  color: Color(0x22828282),
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    super.key,
    required this.child,
    this.border = false,
    this.shadow = true,
  });

  final Widget child;
  final bool border;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    return _BaseContainer(
      color: Colors.white,
      border: border,
      shadow: shadow,
      child: child,
    );
  }
}

class YellowContainer extends StatelessWidget {
  const YellowContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _BaseContainer(
      color: appTheme.colors.elements.yellow,
      border: false,
      shadow: false,
      child: child,
    );
  }
}
