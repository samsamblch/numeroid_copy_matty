import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/components/buttons.dart';
import 'package:numeroid/widgets/kit/kit_textfield.dart';

import '../../core/app_route.dart';
import 'widgets/auth_disclaimer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Войти или создать аккаунт',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              KitTextField(
                title: 'Электронная почта',
                onChange: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: AppButtonBlue(
                  text: 'Продолжить через электронную почту',
                  enable: _email.isNotEmpty,
                  onTap: () {
                    context.push(AppRoutes.password, extra: _email);
                  },
                ),
              ),
              const SizedBox(height: 16),
              const AuthDisclaimer(),
            ],
          ),
        ),
      ),
    );
  }
}
