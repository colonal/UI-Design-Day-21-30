import 'package:flutter/material.dart';
import 'package:ui_design_day_21_30/day25-26/models/user.dart';

class Day26Screen extends StatefulWidget {
  const Day26Screen({Key? key}) : super(key: key);

  @override
  State<Day26Screen> createState() => _Day26ScreenState();
}

class _Day26ScreenState extends State<Day26Screen> {
  final List<User> _users = [
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
  final List<User> _selectedUsers = [];

  final GlobalKey<AnimatedListState> selectedListKey =
      GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Add members",
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Selected Memebers",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 60,
                    child: AnimatedList(
                      key: selectedListKey,
                      scrollDirection: Axis.horizontal,
                      initialItemCount: _selectedUsers.length,
                      itemBuilder: ((context, index, animation) =>
                          selectedUsersComponent(
                              index: index,
                              user: _selectedUsers[index],
                              animation: animation)),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: AnimatedList(
                key: listKey,
                initialItemCount: _users.length,
                itemBuilder: ((context, index, animation) => _buildFollowuser(
                      index: index,
                      user: _users[index],
                      animation: animation,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildFollowuser({index, required User user, animation}) {
    return FadeTransition(
      opacity: animation,
      child: InkWell(
        onTap: (() {
          setState(() {
            listKey.currentState?.removeItem(
                index,
                (context, animation) => _buildFollowuser(
                    user: user, index: index, animation: animation),
                duration: const Duration(milliseconds: 300));

            selectedListKey.currentState?.insertItem(_selectedUsers.length,
                duration: const Duration(milliseconds: 500));

            _selectedUsers.add(user);
            _users.remove(user);
          });
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user.imag),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.userName,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    user.user,
                    style: TextStyle(color: Colors.grey[600], fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectedUsersComponent({required User user, index, animation}) {
    return FadeTransition(
      opacity: animation,
      child: Stack(
        children: [
          Container(
              margin: const EdgeInsets.only(right: 20),
              width: 60,
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(user.imag),
              )),
          Positioned(
            top: 0,
            right: 15,
            child: GestureDetector(
              onTap: () {
                listKey.currentState?.insertItem(_users.length,
                    duration: const Duration(milliseconds: 500));
                selectedListKey.currentState?.removeItem(
                    index,
                    (context, animation) => selectedUsersComponent(
                        user: user, index: index, animation: animation),
                    duration: const Duration(milliseconds: 300));

                _selectedUsers.remove(user);
                _users.add(user);
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    shape: BoxShape.circle,
                    color: Colors.grey[200]),
                child: const Center(
                    child: Icon(
                  Icons.close,
                  size: 18,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
