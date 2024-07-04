import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';
import 'package:numeroid/widgets/kit/common.dart';
import 'package:numeroid/widgets/kit/decorations.dart';

import '../domain/repository/support_repository.dart';

class Dialogs {
  static void showAppDialog({
    required BuildContext context,
    required String title,
    required Widget body,
    bool autoScroll = true,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            // elevation: 0,
            backgroundColor: Colors.transparent,
            // shape: const RoundedRectangleBorder(
            //   borderRadius: BorderRadius.all(
            //     Radius.circular(12),
            //   ),
            // ),
            // insetPadding: const EdgeInsets.all(10),
            body: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: KitDecorations.whiteRBoxWithBorder(radius: 12).copyWith(
                      color: appTheme.colors.background.primary,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 44),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  title,
                                  style: KitTextStyles.semiBold16.copyWith(
                                    color: appTheme.colors.text.primary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 44,
                              child: IconButton(
                                icon: Icon(
                                  Icons.cancel_outlined,
                                  color: appTheme.colors.text.secondary,
                                  size: 24,
                                ),
                                onPressed: () {
                                  appNavigator.pop();
                                },
                              ),
                            ),
                          ],
                        ),
                        const KitSeparator(),
                        // body,
                        if (autoScroll)
                          Container(
                            constraints: const BoxConstraints(maxHeight: 500),
                            child: SingleChildScrollView(child: body),
                          )
                        else
                          body,
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        });
  }

  static Future<void> showAssetText(
    BuildContext context, {
    required String title,
    required String fileName,
  }) async {
    final text = await SupportRepository().loadText(fileName: fileName);

    showAppDialog(
      // ignore: use_build_context_synchronously
      context: context,
      title: title,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
        ),
      ),
    );
  }

  static void showPopup({
    required BuildContext context,
    required Widget child,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return child;
        });
  }
}