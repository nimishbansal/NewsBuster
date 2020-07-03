// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class BookmarkedArticleData extends DataClass
    implements Insertable<BookmarkedArticleData> {
  final String id;
  final String json_detail;
  BookmarkedArticleData({@required this.id, @required this.json_detail});
  factory BookmarkedArticleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return BookmarkedArticleData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      json_detail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}json_detail']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || json_detail != null) {
      map['json_detail'] = Variable<String>(json_detail);
    }
    return map;
  }

  BookmarkedArticleCompanion toCompanion(bool nullToAbsent) {
    return BookmarkedArticleCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      json_detail: json_detail == null && nullToAbsent
          ? const Value.absent()
          : Value(json_detail),
    );
  }

  factory BookmarkedArticleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BookmarkedArticleData(
      id: serializer.fromJson<String>(json['id']),
      json_detail: serializer.fromJson<String>(json['json_detail']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'json_detail': serializer.toJson<String>(json_detail),
    };
  }

  BookmarkedArticleData copyWith({String id, String json_detail}) =>
      BookmarkedArticleData(
        id: id ?? this.id,
        json_detail: json_detail ?? this.json_detail,
      );
  @override
  String toString() {
    return (StringBuffer('BookmarkedArticleData(')
          ..write('id: $id, ')
          ..write('json_detail: $json_detail')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, json_detail.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BookmarkedArticleData &&
          other.id == this.id &&
          other.json_detail == this.json_detail);
}

class BookmarkedArticleCompanion
    extends UpdateCompanion<BookmarkedArticleData> {
  final Value<String> id;
  final Value<String> json_detail;
  const BookmarkedArticleCompanion({
    this.id = const Value.absent(),
    this.json_detail = const Value.absent(),
  });
  BookmarkedArticleCompanion.insert({
    @required String id,
    @required String json_detail,
  })  : id = Value(id),
        json_detail = Value(json_detail);
  static Insertable<BookmarkedArticleData> custom({
    Expression<String> id,
    Expression<String> json_detail,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (json_detail != null) 'json_detail': json_detail,
    });
  }

  BookmarkedArticleCompanion copyWith(
      {Value<String> id, Value<String> json_detail}) {
    return BookmarkedArticleCompanion(
      id: id ?? this.id,
      json_detail: json_detail ?? this.json_detail,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (json_detail.present) {
      map['json_detail'] = Variable<String>(json_detail.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkedArticleCompanion(')
          ..write('id: $id, ')
          ..write('json_detail: $json_detail')
          ..write(')'))
        .toString();
  }
}

class $BookmarkedArticleTable extends BookmarkedArticle
    with TableInfo<$BookmarkedArticleTable, BookmarkedArticleData> {
  final GeneratedDatabase _db;
  final String _alias;
  $BookmarkedArticleTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _json_detailMeta =
      const VerificationMeta('json_detail');
  GeneratedTextColumn _json_detail;
  @override
  GeneratedTextColumn get json_detail =>
      _json_detail ??= _constructJsonDetail();
  GeneratedTextColumn _constructJsonDetail() {
    return GeneratedTextColumn(
      'json_detail',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, json_detail];
  @override
  $BookmarkedArticleTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bookmarked_article';
  @override
  final String actualTableName = 'bookmarked_article';
  @override
  VerificationContext validateIntegrity(
      Insertable<BookmarkedArticleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('json_detail')) {
      context.handle(
          _json_detailMeta,
          json_detail.isAcceptableOrUnknown(
              data['json_detail'], _json_detailMeta));
    } else if (isInserting) {
      context.missing(_json_detailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkedArticleData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BookmarkedArticleData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BookmarkedArticleTable createAlias(String alias) {
    return $BookmarkedArticleTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $BookmarkedArticleTable _bookmarkedArticle;
  $BookmarkedArticleTable get bookmarkedArticle =>
      _bookmarkedArticle ??= $BookmarkedArticleTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bookmarkedArticle];
}
