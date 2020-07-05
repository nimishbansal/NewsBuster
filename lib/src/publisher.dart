import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'publisher.g.dart';

abstract class Publisher implements Built<Publisher, PublisherBuilder> {
  static Serializer<Publisher> get serializer => _$publisherSerializer;

  String get name;
  String get publisherImageUrl;
  Publisher._();
  factory Publisher([void Function(PublisherBuilder) updates]) = _$Publisher;


}