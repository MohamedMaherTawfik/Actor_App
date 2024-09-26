import 'package:actors_gallery/data/models/actor_model.dart';
import 'package:flutter/material.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Actors> actors;

  CharactersLoaded(this.actors);
}
