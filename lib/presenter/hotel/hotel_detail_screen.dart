import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../domain/model/bo/hotel.dart';

@RoutePage()
class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
