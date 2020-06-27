import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'fact_check_result.g.dart';

abstract class FactCheckResult implements Built<FactCheckResult, FactCheckResultBuilder> {
  static Serializer<FactCheckResult> get serializer => _$factCheckResultSerializer;

  @nullable
  String get result;
  FactCheckResult._();
  factory FactCheckResult([void Function(FactCheckResultBuilder) updates]) = _$FactCheckResult;
}