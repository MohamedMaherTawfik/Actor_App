import 'package:actors_gallery/data/models/actor_info_model.dart';
import 'package:actors_gallery/data/services/actor_webservices.dart';

class ActorInfoRepository {
  final ActorWebservices actorWebservices;

  ActorInfoRepository({required this.actorWebservices});
  Future<ActorInfo> getActorInfo(int id) async {
    final actorInfo = await actorWebservices.getAllDetails(id);
    return ActorInfo.fromJson(actorInfo);
  }
}
