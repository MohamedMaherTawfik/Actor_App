part of 'actor_info_cubit.dart';

@immutable
sealed class ActorInfoState {}

final class ActorInfoInitial extends ActorInfoState {}

final class ActorInfoLoaded extends ActorInfoState {
  final ActorInfo actorInfo;
  ActorInfoLoaded(this.actorInfo);
}
