// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distance_unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DistanceUnit _$DistanceUnitFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'cm':
      return Centimeter.fromJson(json);
    case 'inch':
      return Inch.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'DistanceUnit',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DistanceUnit {
  double get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double value) cm,
    required TResult Function(double value, int graduations) inch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double value)? cm,
    TResult? Function(double value, int graduations)? inch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double value)? cm,
    TResult Function(double value, int graduations)? inch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Centimeter value) cm,
    required TResult Function(Inch value) inch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Centimeter value)? cm,
    TResult? Function(Inch value)? inch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Centimeter value)? cm,
    TResult Function(Inch value)? inch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistanceUnitCopyWith<DistanceUnit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistanceUnitCopyWith<$Res> {
  factory $DistanceUnitCopyWith(
          DistanceUnit value, $Res Function(DistanceUnit) then) =
      _$DistanceUnitCopyWithImpl<$Res, DistanceUnit>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class _$DistanceUnitCopyWithImpl<$Res, $Val extends DistanceUnit>
    implements $DistanceUnitCopyWith<$Res> {
  _$DistanceUnitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CentimeterCopyWith<$Res>
    implements $DistanceUnitCopyWith<$Res> {
  factory _$$CentimeterCopyWith(
          _$Centimeter value, $Res Function(_$Centimeter) then) =
      __$$CentimeterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$CentimeterCopyWithImpl<$Res>
    extends _$DistanceUnitCopyWithImpl<$Res, _$Centimeter>
    implements _$$CentimeterCopyWith<$Res> {
  __$$CentimeterCopyWithImpl(
      _$Centimeter _value, $Res Function(_$Centimeter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$Centimeter(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Centimeter extends Centimeter {
  const _$Centimeter(this.value, {final String? $type})
      : $type = $type ?? 'cm',
        super._();

  factory _$Centimeter.fromJson(Map<String, dynamic> json) =>
      _$$CentimeterFromJson(json);

  @override
  final double value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DistanceUnit.cm(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Centimeter &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CentimeterCopyWith<_$Centimeter> get copyWith =>
      __$$CentimeterCopyWithImpl<_$Centimeter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double value) cm,
    required TResult Function(double value, int graduations) inch,
  }) {
    return cm(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double value)? cm,
    TResult? Function(double value, int graduations)? inch,
  }) {
    return cm?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double value)? cm,
    TResult Function(double value, int graduations)? inch,
    required TResult orElse(),
  }) {
    if (cm != null) {
      return cm(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Centimeter value) cm,
    required TResult Function(Inch value) inch,
  }) {
    return cm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Centimeter value)? cm,
    TResult? Function(Inch value)? inch,
  }) {
    return cm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Centimeter value)? cm,
    TResult Function(Inch value)? inch,
    required TResult orElse(),
  }) {
    if (cm != null) {
      return cm(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CentimeterToJson(
      this,
    );
  }
}

abstract class Centimeter extends DistanceUnit {
  const factory Centimeter(final double value) = _$Centimeter;
  const Centimeter._() : super._();

  factory Centimeter.fromJson(Map<String, dynamic> json) =
      _$Centimeter.fromJson;

  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$CentimeterCopyWith<_$Centimeter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InchCopyWith<$Res> implements $DistanceUnitCopyWith<$Res> {
  factory _$$InchCopyWith(_$Inch value, $Res Function(_$Inch) then) =
      __$$InchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double value, int graduations});
}

/// @nodoc
class __$$InchCopyWithImpl<$Res>
    extends _$DistanceUnitCopyWithImpl<$Res, _$Inch>
    implements _$$InchCopyWith<$Res> {
  __$$InchCopyWithImpl(_$Inch _value, $Res Function(_$Inch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? graduations = null,
  }) {
    return _then(_$Inch(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      graduations: null == graduations
          ? _value.graduations
          : graduations // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Inch extends Inch {
  const _$Inch(this.value,
      {this.graduations = defaultGraduations, final String? $type})
      : assert(graduations % 2 == 0 && graduations >= 8 && graduations <= 100),
        $type = $type ?? 'inch',
        super._();

  factory _$Inch.fromJson(Map<String, dynamic> json) => _$$InchFromJson(json);

  @override
  final double value;
  @override
  @JsonKey()
  final int graduations;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DistanceUnit.inch(value: $value, graduations: $graduations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Inch &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.graduations, graduations) ||
                other.graduations == graduations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, graduations);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InchCopyWith<_$Inch> get copyWith =>
      __$$InchCopyWithImpl<_$Inch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double value) cm,
    required TResult Function(double value, int graduations) inch,
  }) {
    return inch(value, graduations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double value)? cm,
    TResult? Function(double value, int graduations)? inch,
  }) {
    return inch?.call(value, graduations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double value)? cm,
    TResult Function(double value, int graduations)? inch,
    required TResult orElse(),
  }) {
    if (inch != null) {
      return inch(value, graduations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Centimeter value) cm,
    required TResult Function(Inch value) inch,
  }) {
    return inch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Centimeter value)? cm,
    TResult? Function(Inch value)? inch,
  }) {
    return inch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Centimeter value)? cm,
    TResult Function(Inch value)? inch,
    required TResult orElse(),
  }) {
    if (inch != null) {
      return inch(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InchToJson(
      this,
    );
  }
}

abstract class Inch extends DistanceUnit {
  const factory Inch(final double value, {final int graduations}) = _$Inch;
  const Inch._() : super._();

  factory Inch.fromJson(Map<String, dynamic> json) = _$Inch.fromJson;

  @override
  double get value;
  int get graduations;
  @override
  @JsonKey(ignore: true)
  _$$InchCopyWith<_$Inch> get copyWith => throw _privateConstructorUsedError;
}
