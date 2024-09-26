// ignore_for_file: non_constant_identifier_names

class Actors {
  late int id;
  late String name;
  late String known_for_department;
  late String original_name;
  late double popularity;
  late String profile_path;
  late bool adult;
  late int gender;

  Actors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    known_for_department = json['known_for_department'];
    original_name = json['original_name'];
    popularity = json['popularity'];
    profile_path = json['profile_path'];
    adult = json['adult'];
    gender = json['gender'];
  }
}
