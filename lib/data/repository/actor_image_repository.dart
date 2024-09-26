import 'package:actors_gallery/data/models/actor_image_model.dart';
import 'package:actors_gallery/data/services/actor_webservices.dart';

class ActorImageRepository {
  final ActorWebservices actorWebservices;

  ActorImageRepository({required this.actorWebservices});

  Future<ActorImages> getAllImages(int id) async {
    final actorImages = await actorWebservices.getAllImages(id);
    return ActorImages.fromJson(actorImages);
  }
}
