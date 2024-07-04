import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/core/app_router.gr.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/widgets/components/buttons.dart';
import 'package:numeroid/widgets/components/textfield.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';

import '../../domain/bloc/screen/screen_bloc.dart';
import '../../domain/repository/user_repository.dart';
import '../../widgets/app_scaffold.dart';
import 'widgets/auth_disclaimer.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String _email = '';

  @override
  void initState() {
    super.initState();
    _email = widget.email;
  }

  void loadData(ScreenBloc bloc) {
    final result = UserRepository().recoveryPassword(email: _email);
    result.then((value) {
      if (value) {
        appNavigator.pushRoute(ForgotPasswordFinishRoute(email: _email));
      } else {
        bloc.add(
          ScreenLoadDataError(
            message: 'Ошибка восстановления',
          ),
        );
      }
    }).catchError((error) {
      bloc.add(
        ScreenLoadDataError(
          message: 'Ошибка восстановления: ${error.toString()}',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScreenBloc(loadData: loadData),
      child: BlocBuilder<ScreenBloc, ScreenState>(
        builder: (context, state) {
          return AppScaffold(
            title: 'Войти или создать аккаунт',
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  const Text(
                    'Забыли пароль?',
                    style: KitTextStyles.semiBold16,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Ничего страшного! Мы отправим вам ссылку для смены пароля на почту.',
                    style: KitTextStyles.medium14,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    title: 'Электронная почта',
                    value: _email,
                    errMessage: (state is ScreenErrorState) ? state.message : null,
                    onChange: (String value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: AppButtonBlue(
                      text: 'Отправить ссылку для смены пароля',
                      enable: _email.isNotEmpty,
                      onTap: () {
                        BlocProvider.of<ScreenBloc>(context).add(ScreenLoadData());
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  const AuthDisclaimer()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
