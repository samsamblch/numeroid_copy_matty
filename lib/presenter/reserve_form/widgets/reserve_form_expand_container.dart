import 'package:flutter/material.dart';
import 'package:numeroid/widgets/kit/common.dart';

import '../../../widgets/kit/decorations.dart';
import '../../../widgets/kit/texts.dart';

class ReserveFormExpandContainer extends StatefulWidget {
  const ReserveFormExpandContainer({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final Widget body;

  @override
  State<ReserveFormExpandContainer> createState() => _ReserveFormExpandContainerState();
}

class _ReserveFormExpandContainerState extends State<ReserveFormExpandContainer> {
  bool _expand = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      decoration: KitDecorations.whiteRBoxWithShadow(),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                _expand = !_expand;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KitTextBold16(widget.title),
                  Image.asset(
                    _expand ? 'assets/icons/expand_up.png' : 'assets/icons/expand_down.png',
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
          if (_expand) KitSeparator(),
          if (_expand)
            Padding(
              padding: const EdgeInsets.all(16),
              child: widget.body,
            ),
        ],
      ),
    );
  }
}
