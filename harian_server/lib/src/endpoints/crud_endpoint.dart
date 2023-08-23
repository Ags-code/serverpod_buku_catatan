import 'package:serverpod/serverpod.dart';
import '../generated/crud_class.dart';

class CrudEndpoint extends Endpoint {
  Future<void> create(Session session, String tittle, String description) async {
    await Crud.insert(session, Crud(tittle: tittle, description: description));
  }

  Future<Crud?> read(Session session, int id) async {
    return await Crud.findById(session, id);
  }

  Future<List<Crud>> readAll(Session session) async {
    return await Crud.find(session);
  }

  Future<void> update(Session session, Crud crud) async {
    await Crud.update(session, crud);
  }

  Future<void> delete(Session session, int id) async {
    await Crud.delete(session, where: (crud) => crud.id.equals(id));
  }
}