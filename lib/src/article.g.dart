// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Article> _$articleSerializer = new _$ArticleSerializer();

class _$ArticleSerializer implements StructuredSerializer<Article> {
  @override
  final Iterable<Type> types = const [Article, _$Article];
  @override
  final String wireName = 'Article';

  @override
  Iterable<Object> serialize(Serializers serializers, Article object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'headline',
      serializers.serialize(object.headline,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(String)),
      'publishDate',
      serializers.serialize(object.publishDate,
          specifiedType: const FullType(String)),
      'publisher',
      serializers.serialize(object.publisher,
          specifiedType: const FullType(Publisher)),
      'claim',
      serializers.serialize(object.claim,
          specifiedType: const FullType(FactCheckResult)),
    ];
    if (object.article != null) {
      result
        ..add('article')
        ..add(serializers.serialize(object.article,
            specifiedType: const FullType(String)));
    }
    if (object.imageUrl != null) {
      result
        ..add('imageUrl')
        ..add(serializers.serialize(object.imageUrl,
            specifiedType: const FullType(String)));
    }
    if (object.articleUrl != null) {
      result
        ..add('articleUrl')
        ..add(serializers.serialize(object.articleUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Article deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArticleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'headline':
          result.headline = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publishDate':
          result.publishDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'article':
          result.article = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'articleUrl':
          result.articleUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publisher':
          result.publisher.replace(serializers.deserialize(value,
              specifiedType: const FullType(Publisher)) as Publisher);
          break;
        case 'claim':
          result.claim.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FactCheckResult))
              as FactCheckResult);
          break;
      }
    }

    return result.build();
  }
}

class _$Article extends Article {
  @override
  final String headline;
  @override
  final String author;
  @override
  final String publishDate;
  @override
  final String article;
  @override
  final String imageUrl;
  @override
  final String articleUrl;
  @override
  final Publisher publisher;
  @override
  final FactCheckResult claim;

  factory _$Article([void Function(ArticleBuilder) updates]) =>
      (new ArticleBuilder()..update(updates)).build();

  _$Article._(
      {this.headline,
      this.author,
      this.publishDate,
      this.article,
      this.imageUrl,
      this.articleUrl,
      this.publisher,
      this.claim})
      : super._() {
    if (headline == null) {
      throw new BuiltValueNullFieldError('Article', 'headline');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('Article', 'author');
    }
    if (publishDate == null) {
      throw new BuiltValueNullFieldError('Article', 'publishDate');
    }
    if (publisher == null) {
      throw new BuiltValueNullFieldError('Article', 'publisher');
    }
    if (claim == null) {
      throw new BuiltValueNullFieldError('Article', 'claim');
    }
  }

  @override
  Article rebuild(void Function(ArticleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticleBuilder toBuilder() => new ArticleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Article &&
        headline == other.headline &&
        author == other.author &&
        publishDate == other.publishDate &&
        article == other.article &&
        imageUrl == other.imageUrl &&
        articleUrl == other.articleUrl &&
        publisher == other.publisher &&
        claim == other.claim;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, headline.hashCode), author.hashCode),
                            publishDate.hashCode),
                        article.hashCode),
                    imageUrl.hashCode),
                articleUrl.hashCode),
            publisher.hashCode),
        claim.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Article')
          ..add('headline', headline)
          ..add('author', author)
          ..add('publishDate', publishDate)
          ..add('article', article)
          ..add('imageUrl', imageUrl)
          ..add('articleUrl', articleUrl)
          ..add('publisher', publisher)
          ..add('claim', claim))
        .toString();
  }
}

class ArticleBuilder implements Builder<Article, ArticleBuilder> {
  _$Article _$v;

  String _headline;
  String get headline => _$this._headline;
  set headline(String headline) => _$this._headline = headline;

  String _author;
  String get author => _$this._author;
  set author(String author) => _$this._author = author;

  String _publishDate;
  String get publishDate => _$this._publishDate;
  set publishDate(String publishDate) => _$this._publishDate = publishDate;

  String _article;
  String get article => _$this._article;
  set article(String article) => _$this._article = article;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  String _articleUrl;
  String get articleUrl => _$this._articleUrl;
  set articleUrl(String articleUrl) => _$this._articleUrl = articleUrl;

  PublisherBuilder _publisher;
  PublisherBuilder get publisher =>
      _$this._publisher ??= new PublisherBuilder();
  set publisher(PublisherBuilder publisher) => _$this._publisher = publisher;

  FactCheckResultBuilder _claim;
  FactCheckResultBuilder get claim =>
      _$this._claim ??= new FactCheckResultBuilder();
  set claim(FactCheckResultBuilder claim) => _$this._claim = claim;

  ArticleBuilder();

  ArticleBuilder get _$this {
    if (_$v != null) {
      _headline = _$v.headline;
      _author = _$v.author;
      _publishDate = _$v.publishDate;
      _article = _$v.article;
      _imageUrl = _$v.imageUrl;
      _articleUrl = _$v.articleUrl;
      _publisher = _$v.publisher?.toBuilder();
      _claim = _$v.claim?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Article other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Article;
  }

  @override
  void update(void Function(ArticleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Article build() {
    _$Article _$result;
    try {
      _$result = _$v ??
          new _$Article._(
              headline: headline,
              author: author,
              publishDate: publishDate,
              article: article,
              imageUrl: imageUrl,
              articleUrl: articleUrl,
              publisher: publisher.build(),
              claim: claim.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'publisher';
        publisher.build();
        _$failedField = 'claim';
        claim.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Article', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
