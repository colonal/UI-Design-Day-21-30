import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_design_day_21_30/day22/single_user.dart';

import 'data/sample.dart';
import 'models/post.dart';

class Day22Screen extends StatefulWidget {
  const Day22Screen({Key? key}) : super(key: key);

  @override
  State<Day22Screen> createState() => _Day22ScreenState();
}

class _Day22ScreenState extends State<Day22Screen> {
  bool selectForYou = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.list,
                      color: Colors.grey[900],
                      size: 30,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Best place to Find awesome photos",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 35,
                          fontFamily: "Nunito"),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: width,
                      height: 50,
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Container(
                            width: 50,
                            height: 40,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepOrange[700],
                            ),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: "Search for photo",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "For you",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 25,
                          fontFamily: "Nunito"),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            buildForYou(
                                text: "Recommend",
                                width: 40.0,
                                select: selectForYou),
                            const SizedBox(width: 20),
                            buildForYou(
                              text: "Likes",
                              width: 25.0,
                              select: !selectForYou,
                            ),
                          ],
                        ),
                        const Divider(
                          height: 2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    buildPosts(Sample.postOne),
                    buildPosts(Sample.postTwo),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPosts(Post post) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SingleUser(user: post.user),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Hero(
                transitionOnUserGestures: true,
                tag: post.user.username ?? "",
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(post.user.profilePicture ?? ""),
                  backgroundColor: Colors.grey,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${post.user.username}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito"),
                  ),
                  Text(
                    post.location,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontFamily: "Nunito"),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                post.dateAgo,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontFamily: "Nunito"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: post.photos.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    buildPostPhoto(post.photos[index])),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildForYou({text, width, select}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectForYou = !selectForYou;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                color: select ? Colors.grey[600] : Colors.black,
                fontSize: 20,
                fontFamily: "Nunito"),
          ),
          const SizedBox(height: 5),
          Container(
            width: width,
            height: 3,
            color: select ? Colors.white : Colors.deepOrangeAccent[700],
          ),
        ],
      ),
    );
  }

  buildPostPhoto(image) {
    return Container(
      height: 300,
      width: 300,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child:
                            Image.asset("assets/images/day22/icons/link.png")),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Image.asset("assets/images/day22/icons/heart.png"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
