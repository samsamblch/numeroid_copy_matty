// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_welcome_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchWelcomeScreenState {
  SearchState get searchState => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  /// Create a copy of SearchWelcomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchWelcomeScreenStateCopyWith<SearchWelcomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchWelcomeScreenStateCopyWith<$Res> {
  factory $SearchWelcomeScreenStateCopyWith(SearchWelcomeScreenState value,
          $Res Function(SearchWelcomeScreenState) then) =
      _$SearchWelcomeScreenStateCopyWithImpl<$Res, SearchWelcomeScreenState>;
  @useResult
  $Res call({SearchState searchState, String? errorMsg});

  $SearchStateCopyWith<$Res> get searchState;
}

/// @nodoc
class _$SearchWelcomeScreenStateCopyWithImpl<$Res,
        $Val extends SearchWelcomeScreenState>
    implements $SearchWelcomeScreenStateCopyWith<$Res> {
  _$SearchWelcomeScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchWelcomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchState = null,
    Object? errorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      searchState: null == searchState
          ? _value.searchState
          : searchState // ignore: cast_nullable_to_non_nullable
              as SearchState,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of SearchWelcomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchStateCopyWith<$Res> get searchState {
    return $SearchStateCopyWith<$Res>(_value.searchState, (value) {
      return _then(_value.copyWith(searchState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchWelcomeScreenStateImplCopyWith<$Res>
    implements $SearchWelcomeScreenStateCopyWith<$Res> {
  factory _$$SearchWelcomeScreenStateImplCopyWith(
          _$SearchWelcomeScreenStateImpl value,
          $Res Function(_$SearchWelcomeScreenStateImpl) then) =
      __$$SearchWelcomeScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchState searchState, String? errorMsg});

  @override
  $SearchStateCopyWith<$Res> get searchState;
}

/// @nodoc
class __$$SearchWelcomeScreenStateImplCopyWithImpl<$Res>
    extends _$SearchWelcomeScreenStateCopyWithImpl<$Res,
        _$SearchWelcomeScreenStateImpl>
    implements _$$SearchWelcomeScreenStateImplCopyWith<$Res> {
  __$$SearchWelcomeScreenStateImplCopyWithImpl(
      _$SearchWelcomeScreenStateImpl _value,
      $Res Function(_$SearchWelcomeScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchWelcomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchState = null,
    Object? errorMsg = freezed,
  }) {
    return _then(_$SearchWelcomeScreenStateImpl(
      searchState: null == searchState
          ? _value.searchState
          : searchState // ignore: cast_nullable_to_non_nullable
              as SearchState,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SearchWelcomeScreenStateImpl extends _SearchWelcomeScreenState {
  _$SearchWelcomeScreenStateImpl({required this.searchState, this.errorMsg})
      : super._();

  @override
  final SearchState searchState;
  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'SearchWelcomeScreenState(searchState: $searchState, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchWelcomeScreenStateImpl &&
            (identical(other.searchState, searchState) ||
                other.searchState == searchState) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchState, errorMsg);

  /// Create a copy of SearchWelcomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchWelcomeScreenStateImplCopyWith<_$SearchWelcomeScreenStateImpl>
      get copyWith => __$$SearchWelcomeScreenStateImplCopyWithImpl<
          _$SearchWelcomeScreenStateImpl>(this, _$identity);
}

abstract class _SearchWelcomeScreenState extends SearchWelcomeScreenState {
  factory _SearchWelcomeScreenState(
      {required final SearchState searchState,
      final String? errorMsg}) = _$SearchWelcomeScreenStateImpl;
  _SearchWelcomeScreenState._() : super._();

  @override
  SearchState get searchState;
  @override
  String? get errorMsg;

  /// Create a copy of SearchWelcomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchWelcomeScreenStateImplCopyWith<_$SearchWelcomeScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
