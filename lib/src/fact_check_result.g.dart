// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_check_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FactCheckResult> _$factCheckResultSerializer =
    new _$FactCheckResultSerializer();

class _$FactCheckResultSerializer
    implements StructuredSerializer<FactCheckResult> {
  @override
  final Iterable<Type> types = const [FactCheckResult, _$FactCheckResult];
  @override
  final String wireName = 'FactCheckResult';

  @override
  Iterable<Object> serialize(Serializers serializers, FactCheckResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.result != null) {
      result
        ..add('result')
        ..add(serializers.serialize(object.result,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  FactCheckResult deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FactCheckResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'result':
          result.result = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FactCheckResult extends FactCheckResult {
  @override
  final String result;

  factory _$FactCheckResult([void Function(FactCheckResultBuilder) updates]) =>
      (new FactCheckResultBuilder()..update(updates)).build();

  _$FactCheckResult._({this.result}) : super._();

  @override
  FactCheckResult rebuild(void Function(FactCheckResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FactCheckResultBuilder toBuilder() =>
      new FactCheckResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FactCheckResult && result == other.result;
  }

  @override
  int get hashCode {
    return $jf($jc(0, result.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FactCheckResult')
          ..add('result', result))
        .toString();
  }
}

class FactCheckResultBuilder
    implements Builder<FactCheckResult, FactCheckResultBuilder> {
  _$FactCheckResult _$v;

  String _result;
  String get result => _$this._result;
  set result(String result) => _$this._result = result;

  FactCheckResultBuilder();

  FactCheckResultBuilder get _$this {
    if (_$v != null) {
      _result = _$v.result;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FactCheckResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FactCheckResult;
  }

  @override
  void update(void Function(FactCheckResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FactCheckResult build() {
    final _$result = _$v ?? new _$FactCheckResult._(result: result);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
