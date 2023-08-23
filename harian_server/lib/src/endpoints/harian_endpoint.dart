import 'package:harian_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod/serverpod.dart';

class HarianEndpoint extends Endpoint {
  Future<List<Harian>> getAllHarian(Session session, {String? keyword}) async {
    return await Harian.find(
      session,
      where: (t) =>
          keyword != null ? t.name.like('%$keyword%') : Constant(true),
    );
  }

  Future<bool> addHarian(Session session, Harian harian) async {
    await Harian.insert(session, harian);
    return true;
  }

  Future<bool> updateHarian(Session session, Harian harian) async {
    var result = await Harian.update(session, harian);
    return result;
  }

  Future<bool> deleteHarian(Session session, int id) async {
    var result = await Harian.delete(session, where: (t) => t.id.equals(id));
    return result == 1;
  }
}
