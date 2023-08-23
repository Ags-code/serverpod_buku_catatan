/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'crud_class.dart' as _i2;
import 'example.dart' as _i3;
import 'harian_class.dart' as _i4;
import 'user_class.dart' as _i5;
import 'package:harian_client/src/protocol/crud_class.dart' as _i6;
import 'package:harian_client/src/protocol/harian_class.dart' as _i7;
import 'package:harian_client/src/protocol/user_class.dart' as _i8;
export 'crud_class.dart';
export 'example.dart';
export 'harian_class.dart';
export 'user_class.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Crud) {
      return _i2.Crud.fromJson(data, this) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data, this) as T;
    }
    if (t == _i4.Harian) {
      return _i4.Harian.fromJson(data, this) as T;
    }
    if (t == _i5.User) {
      return _i5.User.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Crud?>()) {
      return (data != null ? _i2.Crud.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Harian?>()) {
      return (data != null ? _i4.Harian.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.User?>()) {
      return (data != null ? _i5.User.fromJson(data, this) : null) as T;
    }
    if (t == List<_i6.Crud>) {
      return (data as List).map((e) => deserialize<_i6.Crud>(e)).toList()
          as dynamic;
    }
    if (t == List<_i7.Harian>) {
      return (data as List).map((e) => deserialize<_i7.Harian>(e)).toList()
          as dynamic;
    }
    if (t == List<_i8.User>) {
      return (data as List).map((e) => deserialize<_i8.User>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Crud) {
      return 'Crud';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.Harian) {
      return 'Harian';
    }
    if (data is _i5.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Crud') {
      return deserialize<_i2.Crud>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (data['className'] == 'Harian') {
      return deserialize<_i4.Harian>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i5.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
