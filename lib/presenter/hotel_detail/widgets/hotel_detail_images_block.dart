import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/dto/photo.dart';

class HotelDetailImagesBlock extends StatefulWidget {
  const HotelDetailImagesBlock({
    super.key,
    required this.photos,
  });

  final List<Photo> photos;

  @override
  State<HotelDetailImagesBlock> createState() => _HotelDetailImagesBlockState();
}

class _HotelDetailImagesBlockState extends State<HotelDetailImagesBlock> {
  final _controller = PageController();
  int _page = 0;

  void onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) => onPageChange,
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: widget.photos
                  .map(
                    (e) => CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: e.url,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  )
                  .toList(),
            ),
            Container(
              color: Colors.black.withOpacity(0.1),
            ),
            GestureDetector(
              onTap: () {
                if (_page == 0) return;
                _page = _page - 1;
                _controller.animateToPage(
                  _page,
                  duration: Durations.short3,
                  curve: Curves.easeInOut,
                );
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity((_page == 0) ? 0.5 : 1),
                      borderRadius: const BorderRadius.horizontal(right: Radius.circular(12))),
                  width: 30,
                  height: 48,
                  child: const Icon(Icons.chevron_left),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_page == widget.photos.length - 1) return;
                _page = _page + 1;
                _controller.animateToPage(
                  _page,
                  duration: Durations.short3,
                  curve: Curves.easeInOut,
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity((_page == widget.photos.length - 1) ? 0.5 : 1),
                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(12))),
                  width: 30,
                  height: 48,
                  child: const Icon(Icons.chevron_right),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
