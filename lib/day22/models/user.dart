import '../models/collocation.dart';

class User {
  late String? name;
  late String? profilePicture;
  late String? username;
  late int? followers;
  late int? following;
  late List<Collocation>? collocation;

  User(
      {this.name,
      this.profilePicture,
      this.username,
      this.followers,
      this.following,
      this.collocation});
}
