// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'documentation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Documentation {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String text, String path) assetsImage,
    required TResult Function(String text, Widget widget, String code) widget,
    required TResult Function(List<DocumentationWidget> widgets) widgetsTable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String text, String path)? assetsImage,
    TResult? Function(String text, Widget widget, String code)? widget,
    TResult? Function(List<DocumentationWidget> widgets)? widgetsTable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String text, String path)? assetsImage,
    TResult Function(String text, Widget widget, String code)? widget,
    TResult Function(List<DocumentationWidget> widgets)? widgetsTable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DocumentationText value) text,
    required TResult Function(DocumentationAssetsImage value) assetsImage,
    required TResult Function(DocumentationWidget value) widget,
    required TResult Function(DocumentationWidgetsTable value) widgetsTable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DocumentationText value)? text,
    TResult? Function(DocumentationAssetsImage value)? assetsImage,
    TResult? Function(DocumentationWidget value)? widget,
    TResult? Function(DocumentationWidgetsTable value)? widgetsTable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DocumentationText value)? text,
    TResult Function(DocumentationAssetsImage value)? assetsImage,
    TResult Function(DocumentationWidget value)? widget,
    TResult Function(DocumentationWidgetsTable value)? widgetsTable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentationCopyWith<$Res> {
  factory $DocumentationCopyWith(
          Documentation value, $Res Function(Documentation) then) =
      _$DocumentationCopyWithImpl<$Res, Documentation>;
}

/// @nodoc
class _$DocumentationCopyWithImpl<$Res, $Val extends Documentation>
    implements $DocumentationCopyWith<$Res> {
  _$DocumentationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DocumentationTextCopyWith<$Res> {
  factory _$$DocumentationTextCopyWith(
          _$DocumentationText value, $Res Function(_$DocumentationText) then) =
      __$$DocumentationTextCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$DocumentationTextCopyWithImpl<$Res>
    extends _$DocumentationCopyWithImpl<$Res, _$DocumentationText>
    implements _$$DocumentationTextCopyWith<$Res> {
  __$$DocumentationTextCopyWithImpl(
      _$DocumentationText _value, $Res Function(_$DocumentationText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$DocumentationText(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DocumentationText extends DocumentationText {
  const _$DocumentationText(this.text) : super._();

  @override
  final String text;

  @override
  String toString() {
    return 'Documentation.text(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentationText &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentationTextCopyWith<_$DocumentationText> get copyWith =>
      __$$DocumentationTextCopyWithImpl<_$DocumentationText>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String text, String path) assetsImage,
    required TResult Function(String text, Widget widget, String code) widget,
    required TResult Function(List<DocumentationWidget> widgets) widgetsTable,
  }) {
    return text(this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String text, String path)? assetsImage,
    TResult? Function(String text, Widget widget, String code)? widget,
    TResult? Function(List<DocumentationWidget> widgets)? widgetsTable,
  }) {
    return text?.call(this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String text, String path)? assetsImage,
    TResult Function(String text, Widget widget, String code)? widget,
    TResult Function(List<DocumentationWidget> widgets)? widgetsTable,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DocumentationText value) text,
    required TResult Function(DocumentationAssetsImage value) assetsImage,
    required TResult Function(DocumentationWidget value) widget,
    required TResult Function(DocumentationWidgetsTable value) widgetsTable,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DocumentationText value)? text,
    TResult? Function(DocumentationAssetsImage value)? assetsImage,
    TResult? Function(DocumentationWidget value)? widget,
    TResult? Function(DocumentationWidgetsTable value)? widgetsTable,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DocumentationText value)? text,
    TResult Function(DocumentationAssetsImage value)? assetsImage,
    TResult Function(DocumentationWidget value)? widget,
    TResult Function(DocumentationWidgetsTable value)? widgetsTable,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class DocumentationText extends Documentation {
  const factory DocumentationText(final String text) = _$DocumentationText;
  const DocumentationText._() : super._();

  String get text;
  @JsonKey(ignore: true)
  _$$DocumentationTextCopyWith<_$DocumentationText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DocumentationAssetsImageCopyWith<$Res> {
  factory _$$DocumentationAssetsImageCopyWith(_$DocumentationAssetsImage value,
          $Res Function(_$DocumentationAssetsImage) then) =
      __$$DocumentationAssetsImageCopyWithImpl<$Res>;
  @useResult
  $Res call({String text, String path});
}

/// @nodoc
class __$$DocumentationAssetsImageCopyWithImpl<$Res>
    extends _$DocumentationCopyWithImpl<$Res, _$DocumentationAssetsImage>
    implements _$$DocumentationAssetsImageCopyWith<$Res> {
  __$$DocumentationAssetsImageCopyWithImpl(_$DocumentationAssetsImage _value,
      $Res Function(_$DocumentationAssetsImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? path = null,
  }) {
    return _then(_$DocumentationAssetsImage(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DocumentationAssetsImage extends DocumentationAssetsImage {
  const _$DocumentationAssetsImage({required this.text, required this.path})
      : super._();

  @override
  final String text;
  @override
  final String path;

  @override
  String toString() {
    return 'Documentation.assetsImage(text: $text, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentationAssetsImage &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentationAssetsImageCopyWith<_$DocumentationAssetsImage>
      get copyWith =>
          __$$DocumentationAssetsImageCopyWithImpl<_$DocumentationAssetsImage>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String text, String path) assetsImage,
    required TResult Function(String text, Widget widget, String code) widget,
    required TResult Function(List<DocumentationWidget> widgets) widgetsTable,
  }) {
    return assetsImage(this.text, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String text, String path)? assetsImage,
    TResult? Function(String text, Widget widget, String code)? widget,
    TResult? Function(List<DocumentationWidget> widgets)? widgetsTable,
  }) {
    return assetsImage?.call(this.text, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String text, String path)? assetsImage,
    TResult Function(String text, Widget widget, String code)? widget,
    TResult Function(List<DocumentationWidget> widgets)? widgetsTable,
    required TResult orElse(),
  }) {
    if (assetsImage != null) {
      return assetsImage(this.text, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DocumentationText value) text,
    required TResult Function(DocumentationAssetsImage value) assetsImage,
    required TResult Function(DocumentationWidget value) widget,
    required TResult Function(DocumentationWidgetsTable value) widgetsTable,
  }) {
    return assetsImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DocumentationText value)? text,
    TResult? Function(DocumentationAssetsImage value)? assetsImage,
    TResult? Function(DocumentationWidget value)? widget,
    TResult? Function(DocumentationWidgetsTable value)? widgetsTable,
  }) {
    return assetsImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DocumentationText value)? text,
    TResult Function(DocumentationAssetsImage value)? assetsImage,
    TResult Function(DocumentationWidget value)? widget,
    TResult Function(DocumentationWidgetsTable value)? widgetsTable,
    required TResult orElse(),
  }) {
    if (assetsImage != null) {
      return assetsImage(this);
    }
    return orElse();
  }
}

abstract class DocumentationAssetsImage extends Documentation {
  const factory DocumentationAssetsImage(
      {required final String text,
      required final String path}) = _$DocumentationAssetsImage;
  const DocumentationAssetsImage._() : super._();

  String get text;
  String get path;
  @JsonKey(ignore: true)
  _$$DocumentationAssetsImageCopyWith<_$DocumentationAssetsImage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DocumentationWidgetCopyWith<$Res> {
  factory _$$DocumentationWidgetCopyWith(_$DocumentationWidget value,
          $Res Function(_$DocumentationWidget) then) =
      __$$DocumentationWidgetCopyWithImpl<$Res>;
  @useResult
  $Res call({String text, Widget widget, String code});
}

/// @nodoc
class __$$DocumentationWidgetCopyWithImpl<$Res>
    extends _$DocumentationCopyWithImpl<$Res, _$DocumentationWidget>
    implements _$$DocumentationWidgetCopyWith<$Res> {
  __$$DocumentationWidgetCopyWithImpl(
      _$DocumentationWidget _value, $Res Function(_$DocumentationWidget) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? widget = null,
    Object? code = null,
  }) {
    return _then(_$DocumentationWidget(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DocumentationWidget extends DocumentationWidget {
  const _$DocumentationWidget(
      {required this.text, required this.widget, required this.code})
      : super._();

  @override
  final String text;
  @override
  final Widget widget;
  @override
  final String code;

  @override
  String toString() {
    return 'Documentation.widget(text: $text, widget: $widget, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentationWidget &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.widget, widget) || other.widget == widget) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, widget, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentationWidgetCopyWith<_$DocumentationWidget> get copyWith =>
      __$$DocumentationWidgetCopyWithImpl<_$DocumentationWidget>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String text, String path) assetsImage,
    required TResult Function(String text, Widget widget, String code) widget,
    required TResult Function(List<DocumentationWidget> widgets) widgetsTable,
  }) {
    return widget(this.text, this.widget, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String text, String path)? assetsImage,
    TResult? Function(String text, Widget widget, String code)? widget,
    TResult? Function(List<DocumentationWidget> widgets)? widgetsTable,
  }) {
    return widget?.call(this.text, this.widget, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String text, String path)? assetsImage,
    TResult Function(String text, Widget widget, String code)? widget,
    TResult Function(List<DocumentationWidget> widgets)? widgetsTable,
    required TResult orElse(),
  }) {
    if (widget != null) {
      return widget(this.text, this.widget, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DocumentationText value) text,
    required TResult Function(DocumentationAssetsImage value) assetsImage,
    required TResult Function(DocumentationWidget value) widget,
    required TResult Function(DocumentationWidgetsTable value) widgetsTable,
  }) {
    return widget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DocumentationText value)? text,
    TResult? Function(DocumentationAssetsImage value)? assetsImage,
    TResult? Function(DocumentationWidget value)? widget,
    TResult? Function(DocumentationWidgetsTable value)? widgetsTable,
  }) {
    return widget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DocumentationText value)? text,
    TResult Function(DocumentationAssetsImage value)? assetsImage,
    TResult Function(DocumentationWidget value)? widget,
    TResult Function(DocumentationWidgetsTable value)? widgetsTable,
    required TResult orElse(),
  }) {
    if (widget != null) {
      return widget(this);
    }
    return orElse();
  }
}

abstract class DocumentationWidget extends Documentation {
  const factory DocumentationWidget(
      {required final String text,
      required final Widget widget,
      required final String code}) = _$DocumentationWidget;
  const DocumentationWidget._() : super._();

  String get text;
  Widget get widget;
  String get code;
  @JsonKey(ignore: true)
  _$$DocumentationWidgetCopyWith<_$DocumentationWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DocumentationWidgetsTableCopyWith<$Res> {
  factory _$$DocumentationWidgetsTableCopyWith(
          _$DocumentationWidgetsTable value,
          $Res Function(_$DocumentationWidgetsTable) then) =
      __$$DocumentationWidgetsTableCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DocumentationWidget> widgets});
}

/// @nodoc
class __$$DocumentationWidgetsTableCopyWithImpl<$Res>
    extends _$DocumentationCopyWithImpl<$Res, _$DocumentationWidgetsTable>
    implements _$$DocumentationWidgetsTableCopyWith<$Res> {
  __$$DocumentationWidgetsTableCopyWithImpl(_$DocumentationWidgetsTable _value,
      $Res Function(_$DocumentationWidgetsTable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widgets = null,
  }) {
    return _then(_$DocumentationWidgetsTable(
      widgets: null == widgets
          ? _value._widgets
          : widgets // ignore: cast_nullable_to_non_nullable
              as List<DocumentationWidget>,
    ));
  }
}

/// @nodoc

class _$DocumentationWidgetsTable extends DocumentationWidgetsTable {
  const _$DocumentationWidgetsTable(
      {required final List<DocumentationWidget> widgets})
      : _widgets = widgets,
        super._();

  final List<DocumentationWidget> _widgets;
  @override
  List<DocumentationWidget> get widgets {
    if (_widgets is EqualUnmodifiableListView) return _widgets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_widgets);
  }

  @override
  String toString() {
    return 'Documentation.widgetsTable(widgets: $widgets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentationWidgetsTable &&
            const DeepCollectionEquality().equals(other._widgets, _widgets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_widgets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentationWidgetsTableCopyWith<_$DocumentationWidgetsTable>
      get copyWith => __$$DocumentationWidgetsTableCopyWithImpl<
          _$DocumentationWidgetsTable>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String text, String path) assetsImage,
    required TResult Function(String text, Widget widget, String code) widget,
    required TResult Function(List<DocumentationWidget> widgets) widgetsTable,
  }) {
    return widgetsTable(widgets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String text, String path)? assetsImage,
    TResult? Function(String text, Widget widget, String code)? widget,
    TResult? Function(List<DocumentationWidget> widgets)? widgetsTable,
  }) {
    return widgetsTable?.call(widgets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String text, String path)? assetsImage,
    TResult Function(String text, Widget widget, String code)? widget,
    TResult Function(List<DocumentationWidget> widgets)? widgetsTable,
    required TResult orElse(),
  }) {
    if (widgetsTable != null) {
      return widgetsTable(widgets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DocumentationText value) text,
    required TResult Function(DocumentationAssetsImage value) assetsImage,
    required TResult Function(DocumentationWidget value) widget,
    required TResult Function(DocumentationWidgetsTable value) widgetsTable,
  }) {
    return widgetsTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DocumentationText value)? text,
    TResult? Function(DocumentationAssetsImage value)? assetsImage,
    TResult? Function(DocumentationWidget value)? widget,
    TResult? Function(DocumentationWidgetsTable value)? widgetsTable,
  }) {
    return widgetsTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DocumentationText value)? text,
    TResult Function(DocumentationAssetsImage value)? assetsImage,
    TResult Function(DocumentationWidget value)? widget,
    TResult Function(DocumentationWidgetsTable value)? widgetsTable,
    required TResult orElse(),
  }) {
    if (widgetsTable != null) {
      return widgetsTable(this);
    }
    return orElse();
  }
}

abstract class DocumentationWidgetsTable extends Documentation {
  const factory DocumentationWidgetsTable(
          {required final List<DocumentationWidget> widgets}) =
      _$DocumentationWidgetsTable;
  const DocumentationWidgetsTable._() : super._();

  List<DocumentationWidget> get widgets;
  @JsonKey(ignore: true)
  _$$DocumentationWidgetsTableCopyWith<_$DocumentationWidgetsTable>
      get copyWith => throw _privateConstructorUsedError;
}
