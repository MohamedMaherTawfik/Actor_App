import 'package:actors_gallery/data/models/actor_image_model.dart';
import 'package:actors_gallery/data/repository/actor_image_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'actor_images_state.dart';

class ActorImagesCubit extends Cubit<ActorImagesState> {
  ActorImagesCubit(this.actorImageRepository) : super(ActorImagesInitial());
  final ActorImageRepository actorImageRepository;

  Future<void> getActorImages(int id) async {
    ActorImages actorImages = await actorImageRepository.getAllImages(id);
    emit(ActorImagesLoaded(actorImages));
  }
}
