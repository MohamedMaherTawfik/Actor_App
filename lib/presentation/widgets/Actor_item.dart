import 'package:actors_gallery/constants/mycolors.dart';
import 'package:actors_gallery/data/models/actor_model.dart';
import 'package:actors_gallery/presentation/screens/actor_details_screen.dart';
import 'package:flutter/material.dart';

class ActroiTem extends StatelessWidget {
  final Actors actors;
  const ActroiTem({super.key, required this.actors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ActorsDetailsScreen(
                      actors: actors,
                    ))),
        child: GridTile(
          child: Hero(
            tag: actors.id,
            child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: MyColors.myGrey,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${actors.profile_path}',
                  fit: BoxFit.cover,
                )),
          ),
          footer: GridTile(
              child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${actors.name}',
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          )),
        ),
      ),
    );
  }
}
