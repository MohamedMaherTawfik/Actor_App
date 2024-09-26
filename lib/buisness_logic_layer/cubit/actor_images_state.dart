part of 'actor_images_cubit.dart';

@immutable
sealed class ActorImagesState {}

final class ActorImagesInitial extends ActorImagesState {}

final class ActorImagesLoaded extends ActorImagesState {
  final ActorImages actorImages;

  ActorImagesLoaded(this.actorImages);
}
