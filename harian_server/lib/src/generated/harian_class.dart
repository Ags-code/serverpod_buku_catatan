/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Harian extends _i1.TableRow {
  Harian({
    int? id,
    required this.name,
    required this.deskripsi,
    required this.isPrime,
  }) : super(id);

  factory Harian.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Harian(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      deskripsi: serializationManager
          .deserialize<String>(jsonSerialization['deskripsi']),
      isPrime:
          serializationManager.deserialize<bool>(jsonSerialization['isPrime']),
    );
  }

  static final t = HarianTable();

  String name;

  String deskripsi;

  bool isPrime;

  @override
  String get tableName => 'harian';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'deskripsi': deskripsi,
      'isPrime': isPrime,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'deskripsi': deskripsi,
      'isPrime': isPrime,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'deskripsi': deskripsi,
      'isPrime': isPrime,
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
      case 'name':
        name = value;
        return;
      case 'deskripsi':
        deskripsi = value;
        return;
      case 'isPrime':
        isPrime = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Harian>> find(
    _i1.Session session, {
    HarianExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Harian>(
      where: where != null ? where(Harian.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Harian?> findSingleRow(
    _i1.Session session, {
    HarianExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Harian>(
      where: where != null ? where(Harian.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Harian?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Harian>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required HarianExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Harian>(
      where: where(Harian.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Harian row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Harian row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Harian row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    HarianExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Harian>(
      where: where != null ? where(Harian.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef HarianExpressionBuilder = _i1.Expression Function(HarianTable);

class HarianTable extends _i1.Table {
  HarianTable() : super(tableName: 'harian');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final deskripsi = _i1.ColumnString('deskripsi');

  final isPrime = _i1.ColumnBool('isPrime');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        deskripsi,
        isPrime,
      ];
}

@Deprecated('Use HarianTable.t instead.')
HarianTable tHarian = HarianTable();
