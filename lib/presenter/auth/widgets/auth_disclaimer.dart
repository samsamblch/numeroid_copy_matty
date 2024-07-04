import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/app_typography.dart';
import '../../../core/locator.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../utils/dialogs.dart';

class AuthDisclaimer extends StatelessWidget {
  const AuthDisclaimer({
    super.key,
  });

  void loadPravilaDisclaimer(
    BuildContext context,
  ) {
    Dialogs.showAssetText(
      context,
      title: 'Правила и условия',
      fileName: 'pravila_i_usloviya_bronirovaniya.txt',
    );
  }

  void loadConfidencialDisclaimer(
    BuildContext context,
  ) {
    Dialogs.showAssetText(
      context,
      title: 'Положения о конфиденциальности',
      fileName: 'politika_confidencial_i_personal.txt',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '${LocaleKeys.login_disclaimer_1.tr()}\n',
        style: AppTypography.medium14.copyWith(color: Colors.black),
        children: [
          TextSpan(
            text: '${LocaleKeys.login_disclaimer_2.tr()}\n',
          ),
          TextSpan(
            text: LocaleKeys.login_disclaimer_3.tr(),
            style: AppTypography.semiBold14.copyWith(
              color: appTheme.colors.elements.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                loadPravilaDisclaimer(context);
              },
          ),
          TextSpan(
            text: ' ${LocaleKeys.login_disclaimer_4.tr()}\n',
          ),
          TextSpan(
            text: LocaleKeys.login_disclaimer_5.tr(),
            style: AppTypography.semiBold14.copyWith(
              color: appTheme.colors.elements.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                loadConfidencialDisclaimer(context);
              },
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
