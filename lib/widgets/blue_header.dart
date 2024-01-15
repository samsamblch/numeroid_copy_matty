import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/widgets/components/buttons.dart';

import '../core/app_router.dart';
import '../core/locator.dart';
import '../domain/bloc/app/app_bloc.dart';

class BlueHeader extends StatefulWidget {
  BlueHeader({
    super.key,
    required this.showMenu,
    required this.onTapSupport,
    required this.onTapProfile,
  });

  final bool showMenu;
  final VoidCallback onTapSupport;
  final VoidCallback onTapProfile;

  @override
  State<BlueHeader> createState() => _BlueHeaderState();
}

class _BlueHeaderState extends State<BlueHeader> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: appBloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            color: appTheme.colors.brand.blue,
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: 56,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        'assets/images/logo_small.png',
                        height: 18,
                      ),
                    ),
                    const Spacer(),
                    if (state.isLogged)
                      GestureDetector(
                        onTap: widget.onTapProfile,
                        child: Container(
                          decoration: BoxDecoration(
                            color: appTheme.colors.brand.peachy,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              'assets/icons/user.png',
                              width: 12,
                              height: 12,
                              color: appTheme.colors.brand.blue,
                            ),
                          ),
                        ),
                      )
                    else
                      AppButtonOrange(
                        text: 'Войти',
                        onTap: () {
                          appNavigator.push(AppRouterPage.login);
                        },
                      ),
                    IconButton(
                      icon: Icon(
                        (widget.showMenu) ? Icons.close : Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: widget.onTapSupport,
                    ),
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
