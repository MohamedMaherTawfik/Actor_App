import 'package:actors_gallery/buisness_logic_layer/cubit/actor_info_cubit.dart';
import 'package:actors_gallery/buisness_logic_layer/cubit/actors_cubit.dart';
import 'package:actors_gallery/constants/strings.dart';
import 'package:actors_gallery/data/repository/actor_info_repository.dart';
import 'package:actors_gallery/data/repository/actor_repository.dart';
import 'package:actors_gallery/data/services/actor_webservices.dart';
import 'package:actors_gallery/presentation/screens/actor_details_screen.dart';
import 'package:actors_gallery/presentation/screens/actor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late ActorRepository actorRepository;
  late CharactersCubit charactersCubit;
  late ActorInfoRepository actorInfoRepository;
  late ActorInfoCubit actorInfoCubit;
  AppRouter() {
    actorRepository = ActorRepository(ActorWebservices());
    charactersCubit = CharactersCubit(actorRepository);

    actorInfoRepository =
        ActorInfoRepository(actorWebservices: ActorWebservices());
    actorInfoCubit = ActorInfoCubit(actorInfoRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (BuildContext context) => charactersCubit),
              BlocProvider(create: (BuildContext context) => actorInfoCubit)
            ],
            child: CharactersScreen(),
          ),
        );
    }
  }
}
