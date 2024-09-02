part of 'reserve_form_bloc.dart';

@freezed
class ReserveFormState with _$ReserveFormState {
  factory ReserveFormState({
    required final Hotel hotel,
    @Default(true) final bool loading,
  }) = _ReserveFormState;

  const ReserveFormState._();
}
