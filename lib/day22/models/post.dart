import 'package:ui_design_day_21_30/day22/models/user.dart';

import '../models/user.dart';

class Post {
  final User user;
  final String location;
  final String dateAgo;
  final List<String> photos;
  final List<String> relatedPhotos;

  Post(
      {required this.location,
      required this.dateAgo,
      required this.photos,
      required this.relatedPhotos,
      user})
      : user = user ?? User();
}
