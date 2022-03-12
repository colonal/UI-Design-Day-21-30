import 'package:flutter/material.dart';
import 'package:ui_design_day_21_30/day25-26/models/user.dart';

class Day25Screen extends StatefulWidget {
  const Day25Screen({Key? key}) : super(key: key);

  @override
  State<Day25Screen> createState() => _Day25ScreenState();
}

class _Day25ScreenState extends State<Day25Screen> {
  final List<User> users = [
    User(
        'Elliana Palacios',
        '@elliana',
        'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b',
        false),
    User(
        'Kayley Dwyer',
        '@kayley',
        'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3',
        false),
    User(
        'Kathleen Mcdonough',
        '@kathleen',
        'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da',
        false),
    User(
        'Kathleen Dyer',
        '@kathleen',
        'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387',
        false),
    User(
        'Mikayla Marquez',
        '@mikayla',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Following",
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ListView.separated(
          itemCount: users.length,
          separatorBuilder: ((context, index) => const SizedBox(height: 10)),
          itemBuilder: (context, index) => _buildFollowuser(
            index: index,
            name: users[index].user,
            user: users[index].userName,
            image: users[index].imag,
            isFollw: users[index].isFollowedByMe,
          ),
        ),
      ),
    );
  }

  _buildFollowuser({index, name, user, image, isFollw = false}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(image),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              user,
              style: TextStyle(color: Colors.grey[600], fontSize: 15),
            ),
          ],
        ),
        const Spacer(),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: InkWell(
            onTap: () {
              setState(() {
                users[index].isFollowedByMe = !users[index].isFollowedByMe;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: 90,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isFollw ? Colors.grey[300] : Colors.white,
              ),
              child: Text(
                isFollw ? "Unfollow" : "Follow",
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
