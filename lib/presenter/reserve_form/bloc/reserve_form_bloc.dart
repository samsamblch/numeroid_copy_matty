import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/bo/hotel.dart';

part 'reserve_form_bloc.freezed.dart';
part 'reserve_form_event.dart';
part 'reserve_form_state.dart';

class ReserveFormBloc extends Bloc<ReserveFormEvent, ReserveFormState> {
  ReserveFormBloc({
    required Hotel hotel,
  }) : super(ReserveFormState(
          hotel: hotel,
        )) {
    on<ReserveFormEvent>((event, emit) {});
  }
}
