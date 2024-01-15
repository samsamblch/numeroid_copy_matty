import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'screen_event.dart';
part 'screen_state.dart';

class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc({
    required this.loadData,
  }) : super(
          const ScreenLoadingState(
            isLoading: false,
          ),
        ) {
    on<ScreenLoadData>(onLoadData);
    on<ScreenLoadDataError>(onLoadDataError);
  }

  final ValueSetter<ScreenBloc> loadData;

  void onLoadData(ScreenLoadData event, Emitter<ScreenState> emit) {
    loadData(this);
  }

  void onLoadDataError(ScreenLoadDataError event, Emitter<ScreenState> emit) {
    emit(ScreenErrorState(
      message: event.message,
      isLoading: false,
    ));
  }
}
