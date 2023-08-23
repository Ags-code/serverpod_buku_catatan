/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Harian extends _i1.SerializableEntity {
  Harian({
    this.id,
    required this.name,
    required this.deskripsi,
    required this.isPrime,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String deskripsi;

  bool isPrime;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'deskripsi': deskripsi,
      'isPrime': isPrime,
    };
  }
}
