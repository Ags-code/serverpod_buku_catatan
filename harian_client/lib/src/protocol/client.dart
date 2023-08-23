/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:harian_client/src/protocol/crud_class.dart' as _i3;
import 'package:harian_client/src/protocol/harian_class.dart' as _i4;
import 'package:harian_client/src/protocol/user_class.dart' as _i5;
import 'dart:io' as _i6;
import 'protocol.dart' as _i7;

class _EndpointCrud extends _i1.EndpointRef {
  _EndpointCrud(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'crud';

  _i2.Future<void> create(
    String tittle,
    String description,
  ) =>
      caller.callServerEndpoint<void>(
        'crud',
        'create',
        {
          'tittle': tittle,
          'description': description,
        },
      );

  _i2.Future<_i3.Crud?> read(int id) => caller.callServerEndpoint<_i3.Crud?>(
        'crud',
        'read',
        {'id': id},
      );

  _i2.Future<List<_i3.Crud>> readAll() =>
      caller.callServerEndpoint<List<_i3.Crud>>(
        'crud',
        'readAll',
        {},
      );

  _i2.Future<void> update(_i3.Crud crud) => caller.callServerEndpoint<void>(
        'crud',
        'update',
        {'crud': crud},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'crud',
        'delete',
        {'id': id},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _EndpointHarian extends _i1.EndpointRef {
  _EndpointHarian(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'harian';

  _i2.Future<List<_i4.Harian>> getAllHarian({String? keyword}) =>
      caller.callServerEndpoint<List<_i4.Harian>>(
        'harian',
        'getAllHarian',
        {'keyword': keyword},
      );

  _i2.Future<bool> addHarian(_i4.Harian harian) =>
      caller.callServerEndpoint<bool>(
        'harian',
        'addHarian',
        {'harian': harian},
      );

  _i2.Future<bool> updateHarian(_i4.Harian harian) =>
      caller.callServerEndpoint<bool>(
        'harian',
        'updateHarian',
        {'harian': harian},
      );

  _i2.Future<bool> deleteHarian(int id) => caller.callServerEndpoint<bool>(
        'harian',
        'deleteHarian',
        {'id': id},
      );
}

class _EndpointUser extends _i1.EndpointRef {
  _EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i5.User> create(_i5.User user) =>
      caller.callServerEndpoint<_i5.User>(
        'user',
        'create',
        {'user': user},
      );

  _i2.Future<_i5.User?> read(int id) => caller.callServerEndpoint<_i5.User?>(
        'user',
        'read',
        {'id': id},
      );

  _i2.Future<List<_i5.User>> readAll() =>
      caller.callServerEndpoint<List<_i5.User>>(
        'user',
        'readAll',
        {},
      );

  _i2.Future<_i5.User> update(_i5.User user) =>
      caller.callServerEndpoint<_i5.User>(
        'user',
        'update',
        {'user': user},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'user',
        'delete',
        {'id': id},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i6.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i7.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    crud = _EndpointCrud(this);
    example = _EndpointExample(this);
    harian = _EndpointHarian(this);
    user = _EndpointUser(this);
  }

  late final _EndpointCrud crud;

  late final _EndpointExample example;

  late final _EndpointHarian harian;

  late final _EndpointUser user;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'crud': crud,
        'example': example,
        'harian': harian,
        'user': user,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
