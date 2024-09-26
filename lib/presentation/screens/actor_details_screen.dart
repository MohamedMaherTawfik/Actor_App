import 'package:actors_gallery/buisness_logic_layer/cubit/actor_info_cubit.dart';
import 'package:actors_gallery/constants/mycolors.dart';
import 'package:actors_gallery/data/models/actor_info_model.dart';
import 'package:actors_gallery/data/models/actor_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class ActorsDetailsScreen extends StatefulWidget {
  ActorsDetailsScreen({
    super.key,
    required this.actors,
  });
  final Actors actors;

  @override
  State<ActorsDetailsScreen> createState() => _ActorsDetailsScreenState();
}

class _ActorsDetailsScreenState extends State<ActorsDetailsScreen> {
  late ActorInfo _actorInfo;
  @override
  void initState() {
    BlocProvider.of<ActorInfoCubit>(context).getActorInfo(widget.actors.id);
    super.initState();
  }

  @override
  Widget actorInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    actor_gender(actorGender) {
      if (widget.actors.gender == 1) {
        actorGender = 'Female';
      } else {
        actorGender = 'Male';
      }
      return actorGender;
    }

    actor_adult(actorAdult) {
      if (widget.actors.adult == false) {
        actorAdult = 'True';
      } else {
        actorAdult = 'No';
      }
      return actorAdult;
    }

    final size = MediaQuery.of(context).size;

    return BlocBuilder<ActorInfoCubit, ActorInfoState>(
        builder: (context, state) {
      if (state is ActorInfoLoaded) {
        _actorInfo = state.actorInfo;
        return Scaffold(
            backgroundColor: MyColors.myGrey,
            body: CustomScrollView(slivers: [
              SliverAppBar(
                  expandedHeight: 500,
                  pinned: true,
                  stretch: true,
                  backgroundColor: MyColors.myGrey,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        _actorInfo.gender.toString()!,
                      )))
            ]));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}
