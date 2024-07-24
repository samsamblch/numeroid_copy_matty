import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/widgets/app_navbar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.title,
    this.hasBack = true,
  });

  final Widget child;
  final String? title;
  final bool hasBack;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: appTheme.colors.background.primary,
        child: Column(
          children: [
            if (title != null)
              AppNavbar(
                text: title!,
                hasBack: hasBack,
              ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
