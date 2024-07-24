// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_detail_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HotelDetailScreenState {
  SearchState get searchState => throw _privateConstructorUsedError;
  Hotel? get hotel => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HotelDetailScreenStateCopyWith<HotelDetailScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelDetailScreenStateCopyWith<$Res> {
  factory $HotelDetailScreenStateCopyWith(HotelDetailScreenState value,
          $Res Function(HotelDetailScreenState) then) =
      _$HotelDetailScreenStateCopyWithImpl<$Res, HotelDetailScreenState>;
  @useResult
  $Res call({SearchState searchState, Hotel? hotel, bool loading});

  $SearchStateCopyWith<$Res> get searchState;
}

/// @nodoc
class _$HotelDetailScreenStateCopyWithImpl<$Res,
        $Val extends HotelDetailScreenState>
    implements $HotelDetailScreenStateCopyWith<$Res> {
  _$HotelDetailScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchState = null,
    Object? hotel = freezed,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      searchState: null == searchState
          ? _value.searchState
          : searchState // ignore: cast_nullable_to_non_nullable
              as SearchState,
      hotel: freezed == hotel
          ? _value.hotel
          : hotel // ignore: cast_nullable_to_non_nullable
              as Hotel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchStateCopyWith<$Res> get searchState {
    return $SearchStateCopyWith<$Res>(_value.searchState, (value) {
      return _then(_value.copyWith(searchState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HotelDetailScreenStateImplCopyWith<$Res>
    implements $HotelDetailScreenStateCopyWith<$Res> {
  factory _$$HotelDetailScreenStateImplCopyWith(
          _$HotelDetailScreenStateImpl value,
          $Res Function(_$HotelDetailScreenStateImpl) then) =
      __$$HotelDetailScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchState searchState, Hotel? hotel, bool loading});

  @override
  $SearchStateCopyWith<$Res> get searchState;
}

/// @nodoc
class __$$HotelDetailScreenStateImplCopyWithImpl<$Res>
    extends _$HotelDetailScreenStateCopyWithImpl<$Res,
        _$HotelDetailScreenStateImpl>
    implements _$$HotelDetailScreenStateImplCopyWith<$Res> {
  __$$HotelDetailScreenStateImplCopyWithImpl(
      _$HotelDetailScreenStateImpl _value,
      $Res Function(_$HotelDetailScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchState = null,
    Object? hotel = freezed,
    Object? loading = null,
  }) {
    return _then(_$HotelDetailScreenStateImpl(
      searchState: null == searchState
          ? _value.searchState
          : searchState // ignore: cast_nullable_to_non_nullable
              as SearchState,
      hotel: freezed == hotel
          ? _value.hotel
          : hotel // ignore: cast_nullable_to_non_nullable
              as Hotel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HotelDetailScreenStateImpl extends _HotelDetailScreenState {
  _$HotelDetailScreenStateImpl(
      {required this.searchState, this.hotel, this.loading = true})
      : super._();

  @override
  final SearchState searchState;
  @override
  final Hotel? hotel;
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'HotelDetailScreenState(searchState: $searchState, hotel: $hotel, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelDetailScreenStateImpl &&
            (identical(other.searchState, searchState) ||
                other.searchState == searchState) &&
            (identical(other.hotel, hotel) || other.hotel == hotel) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchState, hotel, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelDetailScreenStateImplCopyWith<_$HotelDetailScreenStateImpl>
      get copyWith => __$$HotelDetailScreenStateImplCopyWithImpl<
          _$HotelDetailScreenStateImpl>(this, _$identity);
}

abstract class _HotelDetailScreenState extends HotelDetailScreenState {
  factory _HotelDetailScreenState(
      {required final SearchState searchState,
      final Hotel? hotel,
      final bool loading}) = _$HotelDetailScreenStateImpl;
  _HotelDetailScreenState._() : super._();

  @override
  SearchState get searchState;
  @override
  Hotel? get hotel;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$HotelDetailScreenStateImplCopyWith<_$HotelDetailScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
