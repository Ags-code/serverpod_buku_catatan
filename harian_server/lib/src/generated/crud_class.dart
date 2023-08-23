/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Crud extends _i1.TableRow {
  Crud({
    int? id,
    required this.tittle,
    required this.description,
  }) : super(id);

  factory Crud.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Crud(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      tittle:
          serializationManager.deserialize<String>(jsonSerialization['tittle']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
    );
  }

  static final t = CrudTable();

  String tittle;

  String description;

  @override
  String get tableName => 'crud';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tittle': tittle,
      'description': description,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'tittle': tittle,
      'description': description,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'tittle': tittle,
      'description': description,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'tittle':
        tittle = value;
        return;
      case 'description':
        description = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Crud>> find(
    _i1.Session session, {
    CrudExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Crud>(
      where: where != null ? where(Crud.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Crud?> findSingleRow(
    _i1.Session session, {
    CrudExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Crud>(
      where: where != null ? where(Crud.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Crud?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Crud>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required CrudExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Crud>(
      where: where(Crud.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Crud row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Crud row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Crud row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    CrudExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Crud>(
      where: where != null ? where(Crud.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CrudExpressionBuilder = _i1.Expression Function(CrudTable);

class CrudTable extends _i1.Table {
  CrudTable() : super(tableName: 'crud');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final tittle = _i1.ColumnString('tittle');

  final description = _i1.ColumnString('description');

  @override
  List<_i1.Column> get columns => [
        id,
        tittle,
        description,
      ];
}

@Deprecated('Use CrudTable.t instead.')
CrudTable tCrud = CrudTable();
