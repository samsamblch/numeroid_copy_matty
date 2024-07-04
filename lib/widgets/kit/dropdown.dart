import 'package:flutter/material.dart';

class KitDropDownController {
  VoidCallback? _onClose;

  void close() {
    if (_onClose != null) _onClose!();
  }
}

class KitDropDown extends StatefulWidget {
  const KitDropDown({
    super.key,
    required this.childContext,
    required this.child,
    required this.overlay,
    this.padding = EdgeInsets.zero,
    this.anchor = Alignment.bottomRight,
    this.controller,
    this.copyChildWidth = true,
    this.onShow,
    this.onClose,
  });

  final BuildContext childContext;
  final Widget child;
  final Widget overlay; // что показываем при тапе на child
  final EdgeInsets padding;
  final Alignment anchor;
  final bool copyChildWidth;
  final VoidCallback? onShow;
  final VoidCallback? onClose;

  final KitDropDownController? controller;

  @override
  State<KitDropDown> createState() => _KitDropDownState();
}

class _KitDropDownState extends State<KitDropDown> {
  final layerLink = LayerLink();
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    widget.controller?._onClose = () => hideOverlay();
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

    double globalWidth = MediaQuery.sizeOf(context).width;
    final contextSize = (context.findRenderObject() as RenderBox).size;
    final contextPosition = (context.findRenderObject() as RenderBox).localToGlobal(Offset.zero);
    final overlayPosition = (overlay.context.findRenderObject() as RenderBox).localToGlobal(Offset.zero);

    double? right;
    double? top;

    switch (widget.anchor) {
      case (Alignment.bottomRight):
        right = globalWidth - contextPosition.dx - contextSize.width;
        top = contextPosition.dy - overlayPosition.dy + contextSize.height + widget.padding.top;
        break;

      default:
        throw ('unused');
    }

    final entry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.transparent,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => hideOverlay(),
          child: Stack(children: [
            Positioned(
              top: top,
              right: right,
              child: (widget.copyChildWidth)
                  ? SizedBox(
                      width: contextSize.width,
                      child: widget.overlay,
                    )
                  : widget.overlay,
            ),
          ]),
        ),
      ),
    );

    overlay.insert(entry);

    setState(() {
      this.entry = entry;
    });

    if (widget.onShow != null) {
      widget.onShow!();
    }
  }

  void hideOverlay() {
    entry?.remove();
    setState(() {
      entry = null;
    });
    if (widget.onClose != null) {
      widget.onClose!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: () {
          switchOverlay();
        },
        child: widget.child,
      ),
    );
  }
}
