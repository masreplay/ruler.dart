// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Measure<T> _$$_MeasureFromJson<T extends num>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_Measure<T>(
      start: fromJsonT(json['start']),
      end: fromJsonT(json['end']),
    );

Map<String, dynamic> _$$_MeasureToJson<T extends num>(
  _$_Measure<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'start': toJsonT(instance.start),
      'end': toJsonT(instance.end),
    };
