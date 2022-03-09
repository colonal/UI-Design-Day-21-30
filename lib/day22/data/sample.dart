// import '../models/Collocation.dart';

import '../models/post.dart';

import '../models/user.dart';
import '../models/collocation.dart';

class Sample {
  static User mohammad = User(
      name: "Mohammad Rahmani",
      username: "@afgprogrammer",
      followers: 400,
      following: 190,
      profilePicture: "assets/images/day22/users/mohammad.jpg",
      collocation: [
        Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/images/day22/photos/one.jpg",
            posts: [
              Post(
                location: "Kabul, Afghanistan",
                dateAgo: "3 min ago",
                photos: [
                  'assets/images/day22/photos/one.jpg',
                  'assets/images/day22/photos/two.jpg',
                  'assets/images/day22/photos/three.jpg',
                ],
                relatedPhotos: [],
              ),
              Post(
                location: "Herat, Afghanistan",
                dateAgo: "2 week ago",
                photos: [
                  'assets/images/day22/photos/six.jpg',
                  'assets/images/day22/photos/eight.jpg',
                  'assets/images/day22/photos/two.jpg',
                ],
                relatedPhotos: [],
              )
            ]),
        Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/images/day22/photos/five.jpg",
            posts: [
              Post(
                location: "Kabul, Afghanistan",
                dateAgo: "3 min ago",
                photos: [
                  'assets/images/day22/photos/one.jpg',
                  'assets/images/day22/photos/two.jpg',
                  'assets/images/day22/photos/three.jpg',
                ],
                relatedPhotos: [],
              ),
              Post(
                location: "Herat, Afghanistan",
                dateAgo: "2 week ago",
                photos: [
                  'assets/images/day22/photos/six.jpg',
                  'assets/images/day22/photos/eight.jpg',
                  'assets/images/day22/photos/two.jpg',
                ],
                relatedPhotos: [],
              )
            ]),
      ]);

  static User yasir = User(
      name: "Yasir Ahmad",
      username: "@yasirnoori.yn",
      followers: 400,
      following: 190,
      profilePicture: "assets/images/day22/users/yasir.jpg",
      collocation: [
        Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/images/day22/photos/two.jpg",
            posts: [
              Post(
                location: "Kabul, Afghanistan",
                dateAgo: "3 min ago",
                photos: [
                  'assets/images/day22/photos/five.jpg',
                  'assets/images/day22/photos/six.jpg',
                  'assets/images/day22/photos/seven.jpg',
                ],
                relatedPhotos: [],
              ),
              Post(
                location: "Herat, Afghanistan",
                dateAgo: "2 week ago",
                photos: [
                  'assets/images/day22/photos/six.jpg',
                  'assets/images/day22/photos/eight.jpg',
                  'assets/images/day22/photos/two.jpg',
                ],
                relatedPhotos: [],
              )
            ]),
      ]);

  static Post postOne = Post(
      location: "Kabul, Afghanistan",
      dateAgo: "3 min ago",
      photos: [
        'assets/images/day22/photos/one.jpg',
        'assets/images/day22/photos/two.jpg',
        'assets/images/day22/photos/three.jpg'
      ],
      relatedPhotos: [
        'assets/images/day22/photos/four.jpg',
        'assets/images/day22/photos/five.jpg',
        'assets/images/day22/photos/six.jpg',
        'assets/images/day22/photos/seven.jpg',
        'assets/images/day22/photos/eight.jpg'
      ],
      user: mohammad);

  static Post postTwo = Post(
      user: yasir,
      location: "Kabul, Afghanistan",
      dateAgo: "3 min ago",
      photos: [
        'assets/images/day22/photos/four.jpg',
        'assets/images/day22/photos/five.jpg',
        'assets/images/day22/photos/six.jpg',
      ],
      relatedPhotos: [
        'assets/images/day22/photos/one.jpg',
        'assets/images/day22/photos/two.jpg',
        'assets/images/day22/photos/three.jpg',
        'assets/images/day22/photos/four.jpg',
        'assets/images/day22/photos/five.jpg'
      ]);
}
