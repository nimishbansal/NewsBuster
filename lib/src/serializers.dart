
library serializers;

import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:newsbuster/src/article.dart';
import 'package:newsbuster/src/fact_check_result.dart';
import 'package:newsbuster/src/publisher.dart';
import 'package:newsbuster/src/youtube_channel.dart';

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
  YoutubeVideo,
  YoutubeChannelVideosCarousel,
])

final Serializers serializers = _$serializers;
final standardSerializers =
(serializers.toBuilder()..addPlugin(new JsonModifierPlugin())).build();

class JsonModifierPlugin extends StandardJsonPlugin{

    @override
  Object beforeDeserialize(Object object, FullType specifiedType) {
        if (specifiedType.toString() == (Article).toString()){
            LinkedHashMap<String, dynamic> object1 = object;
            // The Json Response we are getting the unique id as "_id" so
            // replacing it with "id" similar to local database.
            if (object1.containsKey('_id')){
                object1['id'] = object1['_id']; // _id is article id
                object1.remove("_id");
                object = object1;
            }
        }
        return super.beforeDeserialize(object, specifiedType);
  }
}