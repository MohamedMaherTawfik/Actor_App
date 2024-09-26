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
                  fontSize: 24),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: MyColors.myWhite,
                fontSize: 18,
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

    Widget showLoadingIndicator() {
      return Center(
        child: CircularProgressIndicator(
          color: MyColors.myYellow,
        ),
      );
    }

    Widget actor_bio(biograpgy) {
      return Text(
        _actorInfo.biography!,
        maxLines: 3,
        style: TextStyle(color: MyColors.myWhite, fontSize: 15),
      );
    }

    final size = MediaQuery.of(context).size;

    return BlocBuilder<ActorInfoCubit, ActorInfoState>(
        builder: (context, state) {
      if (state is ActorInfoLoaded) {
        _actorInfo = state.actorInfo;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: MyColors.myYellow,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              title: Text(
                _actorInfo.name!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: MyColors.myGrey),
              ),
            ),
            backgroundColor: MyColors.myGrey,
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                children: [
                  InstaImageViewer(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      items: [0, 1, 2, 3].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${_actorInfo.profilePath}',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  buildDivider(size.width * 0.0),
                  actorInfo('Original_Name: ', widget.actors.original_name),
                  buildDivider(size.width * 0.6),
                  actorInfo('Adult: ', actor_adult(_actorInfo.adult!)),
                  buildDivider(size.width * 0.83),
                  _actorInfo.alsoKnownAs!.isEmpty
                      ? actorInfo('Aslo Known As: ', 'No Known As Available')
                      : actorInfo('Aslo Known As: ',
                          _actorInfo.alsoKnownAs!.join(' / ')),
                  buildDivider(size.width * 0.6),
                  Text(
                    'Biography: ',
                    style: TextStyle(
                        color: MyColors.myWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Text(
                    _actorInfo.biography == ''
                        ? 'No Biography Available'
                        : _actorInfo.biography!,
                    style: TextStyle(fontSize: 18, color: MyColors.myWhite),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  buildDivider(size.width * 0.0),
                  _actorInfo.placeOfBirth == null
                      ? Text('')
                      : actorInfo('Place of Birth: ', _actorInfo.placeOfBirth!),
                  _actorInfo.placeOfBirth == null
                      ? Container()
                      : buildDivider(size.width * 0.63),
                  _actorInfo.birthday == null
                      ? Container()
                      : actorInfo(
                          'Birthday: ', _actorInfo.birthday!.toString()),
                  _actorInfo.birthday == null || _actorInfo.birthday == ''
                      ? Container()
                      : buildDivider(size.width * 0.75),
                  _actorInfo.popularity == null
                      ? Container()
                      : actorInfo(
                          'Popularity: ', _actorInfo.popularity!.toString()),
                  buildDivider(size.width * 0.71),
                  actorInfo(
                      'Known for Department: ', _actorInfo.knownForDepartment!),
                  buildDivider(size.width * 0.42),
                  actorInfo('Gender: ', actor_gender(_actorInfo.gender!)),
                  buildDivider(size.width * 0.78),
                  actorInfo('imdb_id: ', _actorInfo.imdbId!.toString()),
                  buildDivider(size.width * 0.77),
                ],
              ),
            ));
      } else {
        return Scaffold(body: showLoadingIndicator());
      }
    });
  }
}
