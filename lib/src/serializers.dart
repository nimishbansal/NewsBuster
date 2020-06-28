
library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:newsbuster/src/article.dart';
import 'package:newsbuster/src/fact_check_result.dart';
import 'package:newsbuster/src/publisher.dart';

part 'serializers.g.dart';

/// Example of how to use built_value serialization.
///
/// Declare a top level [Serializers] field called serializers. Annotate it
/// with [SerializersFor] and provide a `const` `List` of types you want to
/// be serializable.
///
/// The built_value code generator will provide the implementation. It will
/// contain serializers for all the types asked for explicitly plus all the
/// types needed transitively via fields.
///
/// You usually only need to do this once per project.
@SerializersFor(const [
    Article,
    Publisher,
    FactCheckResult,
])

final Serializers serializers = _$serializers;
final standardSerializers =
(serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();