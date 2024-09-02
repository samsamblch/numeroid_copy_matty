import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/presenter/reserve_form/bloc/reserve_form_bloc.dart';
import 'package:numeroid/presenter/reserve_form/widgets/reserve_form_body.dart';

import '../../domain/model/bo/hotel.dart';

class ReserveFormScreen extends StatelessWidget {
  const ReserveFormScreen({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReserveFormBloc(hotel: hotel),
      child: const ReserveFormBody(),
    );
  }
}
