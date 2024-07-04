import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/core/app_router.gr.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/domain/bloc/app/app_bloc.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/components/buttons.dart';
import 'package:numeroid/widgets/components/textfield.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';

import '../../domain/bloc/screen/screen_bloc.dart';
import '../../domain/repository/user_repository.dart';
import 'widgets/auth_disclaimer.dart';

@RoutePage()
class PasswordScreen extends StatefulWidget {
  const PasswordScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String _password = '';

  void loadData(ScreenBloc bloc) {
    final result = UserRepository().sendCredentials(email: widget.email, password: _password);
    result.then((value) {
      if (!value.user.active) {
        bloc.add(
          ScreenLoadDataError(
            message: 'Учетная запись не активирована',
          ),
        );
        return;
      }

      appBloc.add(AuthLogin(response: value));
      appNavigator.popRoot();
    }).catchError((error) {
      bloc.add(
        ScreenLoadDataError(
          message: 'Ошибка входа: ${error.toString()}',
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'Введите пароль от аккаунта Numeroid\nдля ',
                        style: KitTextStyles.medium14,
                        children: [
                          TextSpan(
                            text: widget.email,
                            style: KitTextStyles.semiBold14,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppSecureTextField(
                      title: 'Пароль',
                      errMessage: (state is ScreenErrorState) ? state.message : null,
                      onChange: (String value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: AppButtonBlue(
                        text: 'Войти',
                        enable: _password.isNotEmpty,
                        onTap: () {
                          BlocProvider.of<ScreenBloc>(context).add(
                            ScreenLoadData(),
                          );
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        appNavigator.pushRoute(
                          ForgotPasswordRoute(
                            email: widget.email,
                          ),
                        );
                      },
                      child: Text(
                        'Забыли пароль?',
                        style: KitTextStyles.medium14.copyWith(
                          color: appTheme.colors.elements.blue,
                        ),
                      ),
                    ),
                    const AuthDisclaimer()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
