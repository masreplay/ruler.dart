import 'package:flutter/material.dart';

extension AsyncSnapshotX<T> on AsyncSnapshot<T> {
  R when<R>({
    required R Function(T snapShot) data,
    required R Function() nullValue,
    required R Function(String error) error,
    required R Function() loading,
  }) {
    final value = this.data;
    if (hasData) {
      if (value == null) {
        return nullValue();
      } else {
        return data(value);
      }
    } else if (hasError) {
      return error(error.toString());
    } else {
      return loading();
    }
  }

  R maybeWhen<R>({
    required R Function() orElse,
    R Function(T snapShot)? data,
    R Function()? nullValue,
    R Function(String error)? error,
    R Function()? loading,
  }) {
    final value = this.data;
    final orElseValue = orElse();
    if (hasData) {
      if (value == null) {
        return nullValue?.call() ?? orElseValue;
      } else {
        return data?.call(value) ?? orElseValue;
      }
    } else if (hasError) {
      return error?.call(error.toString()) ?? orElseValue;
    } else {
      return loading?.call() ?? orElseValue;
    }
  }
}
