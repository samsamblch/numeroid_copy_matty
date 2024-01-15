import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';
import 'components/buttons.dart';
import 'components/containers.dart';
import 'components/spacers.dart';

class MenuBanner extends StatelessWidget {
  const MenuBanner({
    super.key,
    required this.onTapCall,
    required this.onTapMail,
    required this.onTapSupport,
    required this.onTapClose,
  });

  final VoidCallback onTapCall;
  final VoidCallback onTapMail;
  final VoidCallback onTapSupport;
  final VoidCallback onTapClose;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      child: WhiteContainer(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: AppButtonBlue(
                        text: LocaleKeys.call.tr(),
                        onTap: onTapCall,
                      ),
                    ),
                  ),
                  const HorizontalSpacer8(),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: AppButtonOutlineBlue(
                        text: LocaleKeys.call_write.tr(),
                        onTap: onTapMail,
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpacer8(),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: AppButtonOutlineBlack(
                  text: LocaleKeys.call_center.tr(),
                  onTap: onTapSupport,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
