import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_design_day_21_30/day22/models/collocation.dart';
import 'package:ui_design_day_21_30/day22/models/user.dart';

class SingleUser extends StatefulWidget {
  final User user;
  const SingleUser({required this.user, Key? key}) : super(key: key);

  @override
  State<SingleUser> createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  bool selectForYou = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Colors.grey[900],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.more_horiz,
                size: 25,
                color: Colors.grey[900],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    Hero(
                      transitionOnUserGestures: true,
                      tag: widget.user.username ?? "",
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage(widget.user.profilePicture ?? ""),
                        maxRadius: 40,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.user.name ?? "",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.user.username ?? "",
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        makeFollowWidgets(
                            count: widget.user.followers, name: "Followers"),
                        Container(
                          width: 2,
                          height: 15,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.grey,
                        ),
                        makeFollowWidgets(
                            count: widget.user.following, name: "Following"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    makeActionButtons()
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
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
                    Divider(
                      height: 2,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    makeColloction(widget.user.collocation ?? []),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }

  Widget makeFollowWidgets({count, name}) {
    return Row(
      children: <Widget>[
        Text(
          count.toString(),
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 15, color: Colors.grey[800]),
        ),
      ],
    );
  }

  Widget makeActionButtons() {
    return Transform.translate(
      offset: const Offset(0, 20),
      child: Container(
        height: 65,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300]!,
                  blurRadius: 20,
                  offset: const Offset(0, 10))
            ]),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: double.infinity,
                  elevation: 0,
                  onPressed: () {},
                  color: Colors.deepOrangeAccent,
                  child: const Text(
                    "Follow",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
            Expanded(
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: double.infinity,
                  elevation: 0,
                  onPressed: () {},
                  color: Colors.transparent,
                  child: const Text(
                    "Message",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  )),
            )
          ],
        ),
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

  Widget makeColloction(List<Collocation> collocation) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 20),
          height: 320,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: collocation.length,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 1.2 / 1,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(collocation[index].thumbnail),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.orange),
                          child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                        height: 90,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              collocation[index].name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              collocation[index]
                                                      .tags
                                                      .length
                                                      .toString() +
                                                  " photos",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ])),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 32,
                      margin: const EdgeInsets.only(right: 20),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: collocation[index].tags.length,
                        itemBuilder: (context, tagIndex) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300]),
                          child: Center(
                            child: Text(
                              collocation[index].tags[tagIndex],
                              style: const TextStyle(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
