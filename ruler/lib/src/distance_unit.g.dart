// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Centimeter _$$CentimeterFromJson(Map<String, dynamic> json) => _$Centimeter(
      (json['value'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CentimeterToJson(_$Centimeter instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$Inch _$$InchFromJson(Map<String, dynamic> json) => _$Inch(
      (json['value'] as num).toDouble(),
      graduation: json['graduation'] as int? ?? defaultGraduation,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InchToJson(_$Inch instance) => <String, dynamic>{
      'value': instance.value,
      'graduation': instance.graduation,
      'runtimeType': instance.$type,
    };
