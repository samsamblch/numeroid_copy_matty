import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'kit/app_typography.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({
    super.key,
    required this.text,
    this.hasBack = true,
  });

  final String text;
  final bool hasBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (hasBack)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: Image.asset(
                      'assets/icons/arrow_back.png',
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              Text(
                text,
                style: KitTextStyles.semiBold16,
              ),
              if (hasBack)
                const SizedBox(
                  width: 18,
                )
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey.shade100,
        ),
      ],
    );
  }
}
