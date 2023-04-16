// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Measure<T> _$MeasureFromJson<T extends num>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _Measure<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$Measure<T extends num> {
  T get start => throw _privateConstructorUsedError;
  T get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeasureCopyWith<T, Measure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasureCopyWith<T extends num, $Res> {
  factory $MeasureCopyWith(Measure<T> value, $Res Function(Measure<T>) then) =
      _$MeasureCopyWithImpl<T, $Res, Measure<T>>;
  @useResult
  $Res call({T start, T end});
}

/// @nodoc
class _$MeasureCopyWithImpl<T extends num, $Res, $Val extends Measure<T>>
    implements $MeasureCopyWith<T, $Res> {
  _$MeasureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as T,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeasureCopyWith<T extends num, $Res>
    implements $MeasureCopyWith<T, $Res> {
  factory _$$_MeasureCopyWith(
          _$_Measure<T> value, $Res Function(_$_Measure<T>) then) =
      __$$_MeasureCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T start, T end});
}

/// @nodoc
class __$$_MeasureCopyWithImpl<T extends num, $Res>
    extends _$MeasureCopyWithImpl<T, $Res, _$_Measure<T>>
    implements _$$_MeasureCopyWith<T, $Res> {
  __$$_MeasureCopyWithImpl(
      _$_Measure<T> _value, $Res Function(_$_Measure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$_Measure<T>(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as T,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_Measure<T extends num> extends _Measure<T> {
  _$_Measure({required this.start, required this.end}) : super._();

  factory _$_Measure.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_MeasureFromJson(json, fromJsonT);

  @override
  final T start;
  @override
  final T end;

  @override
  String toString() {
    return 'Measure<$T>(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Measure<T> &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasureCopyWith<T, _$_Measure<T>> get copyWith =>
      __$$_MeasureCopyWithImpl<T, _$_Measure<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_MeasureToJson<T>(this, toJsonT);
  }
}

abstract class _Measure<T extends num> extends Measure<T> {
  factory _Measure({required final T start, required final T end}) =
      _$_Measure<T>;
  _Measure._() : super._();

  factory _Measure.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_Measure<T>.fromJson;

  @override
  T get start;
  @override
  T get end;
  @override
  @JsonKey(ignore: true)
  _$$_MeasureCopyWith<T, _$_Measure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
