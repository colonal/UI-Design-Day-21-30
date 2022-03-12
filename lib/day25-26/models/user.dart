class User {
  final String user;
  final String userName;
  final String imag;
  late bool isFollowedByMe = false;

  User(this.user, this.userName, this.imag, this.isFollowedByMe);
}
