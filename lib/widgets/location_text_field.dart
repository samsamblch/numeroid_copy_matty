import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/domain/repository/booking_repository.dart';
import 'package:numeroid/widgets/components/containers.dart';
import 'package:numeroid/widgets/components/spacers.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';

import '../domain/model/dto/city.dart';

class LocationTextField extends StatefulWidget {
  const LocationTextField({
    super.key,
    required this.onChange,
    this.enableBorder = false,
    this.city,
  });

  final ValueChanged<City?> onChange;
  final bool enableBorder;
  final City? city;

  @override
  State<LocationTextField> createState() => _LocationTextFieldState();
}

class _LocationTextFieldState extends State<LocationTextField> {
  final _focusNode = FocusNode();
  final _layerLink = LayerLink();
  final TextEditingController _controller = TextEditingController();
  OverlayEntry? _entry;

  List<City> _cities = [];

  String? termText;

  void onChangedText(String text) {
    termText = text.isNotEmpty ? text : null;
    loadLocations();
  }

  void refreshOverlay() {
    if (_focusNode.hasFocus) {
      hideOverlay();
      showOverlay();
    }
  }

  Future<void> loadLocations() async {
    final locations = await BookingRepository().loadLocations(term: termText);
    _cities = locations;
    refreshOverlay();
  }

  void selectCity(City city) {
    _controller.text = '${city.name}, ${city.country?.name}';
    _focusNode.unfocus();
    widget.onChange(city);
  }

  @override
  void initState() {
    super.initState();

    final city = widget.city;
    if (city != null) {
      _controller.text = '${city.name}, ${city.country?.name}';
    } else {
      loadLocations();
    }

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        showOverlay();
      } else {
        hideOverlay();
      }
    });
  }

  void showOverlay() {
    final overlay = Overlay.of(context);

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 6),
          child: buildOverlay(),
        ),
      ),
    );

    overlay.insert(_entry!);
  }

  void hideOverlay() {
    _entry?.remove();
    _entry = null;
  }

  Widget buildOverlay() => Material(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          constraints: const BoxConstraints(
            maxHeight: 280,
            minHeight: 40,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: _cities
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        selectCity(e);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/pin.png',
                              width: 22,
                            ),
                            const HorizontalSpacer8(),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: '${e.name}, ',
                                  style: KitTextStyles.medium14.copyWith(
                                    color: appTheme.colors.text.primary,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${e.country?.name}, ',
                                      style: KitTextStyles.medium14.copyWith(
                                        color: appTheme.colors.text.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: WhiteContainer(
        border: widget.enableBorder,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/pin.png',
                width: 22,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  cursorColor: appTheme.colors.brand.blue,
                  focusNode: _focusNode,
                  controller: _controller,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Куда вы хотите поехать?',
                    labelStyle: KitTextStyles.semiBold14.copyWith(
                      color: appTheme.colors.text.secondary,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: KitTextStyles.semiBold14,
                  onChanged: onChangedText,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  } else {
                    _focusNode.requestFocus();
                  }
                  setState(() {});
                },
                child: Icon(
                  (_focusNode.hasFocus) ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
