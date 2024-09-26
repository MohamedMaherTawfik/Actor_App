import 'package:actors_gallery/data/models/actor_info_model.dart';
import 'package:actors_gallery/data/repository/actor_info_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'actor_info_state.dart';

class ActorInfoCubit extends Cubit<ActorInfoState> {
  ActorInfoCubit(this.repo) : super(ActorInfoInitial());

  ActorInfoRepository repo;
  Future<void> getActorInfo(int id) async {
    ActorInfo actorInfo = await repo.getActorInfo(id);
    emit(ActorInfoLoaded(actorInfo));
  }
}
