import 'package:actors_gallery/data/models/actor_model.dart';
import 'package:actors_gallery/data/services/actor_webservices.dart';

class ActorRepository {
  final ActorWebservices actorWebservices;

  ActorRepository(this.actorWebservices);

  Future<List<Actors>> getAllCharacters() async {
    final actor = await actorWebservices.getAllCharacters();
    return actor
        .map((actor) => Actors.fromJson(actor as Map<String, dynamic>))
        .toList();
  }
}
