import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/components/buttons.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';

import 'widgets/auth_disclaimer.dart';

@RoutePage()
class ForgotPasswordFinishScreen extends StatelessWidget {
  const ForgotPasswordFinishScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Войти или создать аккаунт',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            const Text(
              'Проверьте папку "Входящие"',
              style: KitTextStyles.semiBold16,
            ),
            Text(
              'Мы отправили инструкцию по смене пароля на $email. Письмо должно придти через несколько минут.',
              style: KitTextStyles.medium14,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: AppButtonBlue(
                text: 'Вернуться на страницу входа',
                onTap: () {
                  appNavigator.popRoot();
                },
              ),
            ),
            const SizedBox(height: 12),
            const AuthDisclaimer()
          ],
        ),
      ),
    );
  }
}
