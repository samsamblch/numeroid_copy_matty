
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../core/app_router.dart';
import '../core/app_typography.dart';
import '../core/locator.dart';

class UnauthPlaceholder extends StatelessWidget {
  const UnauthPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/robot_welcome.png',
            height: 160,
          ),
          const SizedBox(height: 40),
          Text.rich(
            TextSpan(
              text: 'Войдите',
              style: AppTypography.semiBold16.copyWith(
                color: appTheme.colors.elements.blue,
              ),
              recognizer: TapGestureRecognizer()..onTap = () => appNavigator.push(AppRouterPage.login),
              children: [
                TextSpan(
                  text: ' в систему, чтобы\nначать работать в Нумероид',
                  style: AppTypography.semiBold16.copyWith(
                    color: appTheme.colors.text.primary,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
