import 'package:flutter/material.dart';
import 'package:numeroid/core/app_typography.dart';

import '../../core/locator.dart';

class AppDropField extends StatefulWidget {
  const AppDropField({
    super.key,
    this.title,
    required this.texts,
    this.selectedText,
    // this.ignoreSelected = false,
  });

  final String? title;
  final List<String> texts;
  final String? selectedText;
  // final bool ignoreSelected;

  @override
  State<AppDropField> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<AppDropField> {
  final layerLink = LayerLink();
  OverlayEntry? entry;
  int? selected;

  @override
  void initState() {
    super.initState();

    if (widget.selectedText != null) {
      selected =
          widget.texts.indexWhere((element) => element == widget.selectedText);
    }
  }

  void onTapItem(int index) {
    setState(() {
      selected = index;
    });
    hideOverlay();
  }

  void switchOverlay() {
    if (entry == null) {
      showOverlay();
    } else {
      hideOverlay();
    }
  }

  void showOverlay() {
    final overlay = Overlay.of(context);

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset:
              Offset(0, size.height - 2 - ((widget.title != null) ? 26 : 0)),
          child: buildOverlay(),
        ),
      ),
    );

    overlay.insert(entry);

    setState(() {
      this.entry = entry;
    });
  }

  void hideOverlay() {
    entry?.remove();
    setState(() {
      entry = null;
    });
  }

  Widget buildOverlay() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(4),
        bottomRight: Radius.circular(4),
      ),
      child: Material(
        elevation: 0,
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              border: Border(
                left: BorderSide(
                  color: appTheme.colors.border.grey,
                  width: 1,
                ),
                right: BorderSide(
                  color: appTheme.colors.border.grey,
                  width: 1,
                ),
                bottom: BorderSide(
                  color: appTheme.colors.border.grey,
                  width: 1,
                ),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.texts.indexed
                .map(
                  (e) => InkWell(
                    onTap: () => onTapItem(e.$1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          e.$2,
                          style: AppTypography.medium14,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final body = CompositedTransformTarget(
      link: layerLink,
      child: GestureDetector(
        onTap: () {
          switchOverlay();
        },
        child: Container(
          width: double.infinity,
          height: 36,
          decoration: BoxDecoration(
            border: Border.all(
              color: appTheme.colors.border.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    (selected != null)
                        ? widget.texts.elementAtOrNull(selected!) ?? ''
                        : '',
                    style: AppTypography.medium14,
                  ),
                ),
                Icon(
                  (entry != null)
                      ? Icons.expand_less_rounded
                      : Icons.expand_more_rounded,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: AppTypography.semiBold14,
          ),
        if (widget.title != null) const SizedBox(height: 6),
        body,
      ],
    );
  }
}
