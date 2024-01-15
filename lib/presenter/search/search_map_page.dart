import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class SearchMapPage extends StatelessWidget {
  const SearchMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaplibreMap(
      styleString: 'https://map.everyhotel.site/assets/styles/colorful.json',
      initialCameraPosition: const CameraPosition(
        target: LatLng(
          55.751244,
          37.618423,
        ),
        zoom: 8,
      ),
    );
  }
}
