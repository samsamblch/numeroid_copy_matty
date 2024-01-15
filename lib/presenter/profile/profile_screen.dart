import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/core/locator.dart';

import '../../domain/bloc/app/app_bloc.dart';
import '../../widgets/unauth_placeholder.dart';
import 'profile_content_body.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: appBloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return state.isLogged
              ? const ProfileContentBody()
              : const UnauthPlaceholder();
        },
      ),
    );
  }
}
