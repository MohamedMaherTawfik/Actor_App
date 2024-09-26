import 'package:actors_gallery/buisness_logic_layer/cubit/actors_state.dart';
import 'package:actors_gallery/data/models/actor_model.dart';
import 'package:actors_gallery/data/repository/actor_repository.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final ActorRepository actorRepository;
  List<Actors> actors = [];

  CharactersCubit(this.actorRepository) : super(CharactersInitial());

  List<Actors> getAllCharacters() {
    actorRepository.getAllCharacters().then((actors) {
      emit(CharactersLoaded(actors));
      this.actors = actors;
    });
    return actors;
  }
}
