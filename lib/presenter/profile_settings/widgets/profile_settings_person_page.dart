import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';

import '../../../core/locator.dart';
import '../../../domain/bloc/app/app_bloc.dart';
import '../../../widgets/components/containers.dart';
import '../../../widgets/kit/kit_textfield.dart';

class ProfileSettingsPersonPage extends StatelessWidget {
  const ProfileSettingsPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Персональные данные',
          style: KitTextStyles.bold18,
        ),
        const SizedBox(height: 4),
        Text(
          'Заполните свои данные',
          style: KitTextStyles.medium14.copyWith(
            color: appTheme.colors.text.secondary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is AppRunningAuth) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: WhiteContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        KitTextField(
                          title: 'Имя',
                          hintText: 'Введите ваше имя',
                          value: '${state.user.firstName} ${state.user.lastName}',
                          onChange: (value) {},
                        ),
                        const SizedBox(height: 12),
                        KitTextField(
                          title: 'Телефон',
                          hintText: 'Введите номер телефона',
                          value: state.user.phone,
                          onChange: (value) {},
                        ),
                        const SizedBox(height: 12),
                        KitTextField(
                          title: 'Электронная почта',
                          hintText: 'Введите адрес эл.почты',
                          value: state.user.email,
                          onChange: (value) {},
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
