import 'package:flutter/material.dart';

class Day27Screen extends StatefulWidget {
  const Day27Screen({Key? key}) : super(key: key);

  @override
  State<Day27Screen> createState() => _Day27ScreenState();
}

class _Day27ScreenState extends State<Day27Screen> {
  final TextEditingController _controller = TextEditingController();
  final List usersSearch = [];
  final List users = [
    [
      'Elliana Palacios',
      '@elliana',
      'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b',
      false,
      0
    ],
    [
      'Kayley Dwyer',
      '@kayley',
      'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3',
      false,
      1
    ],
    [
      'Kathleen Mcdonough',
      '@kathleen',
      'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da',
      false,
      2
    ],
    [
      'Kathleen Dyer',
      '@kathleen',
      'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387',
      false,
      3
    ],
    [
      'Mikayla Marquez',
      '@mikayla',
      'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
      false,
      4
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[600],
                ),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.grey[50],
                      fontSize: 16,
                    ),
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey[50],
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 18,
                  ),
                  cursorColor: Colors.white,
                  onChanged: (text) {
                    setState(() {
                      usersSearch.clear();
                      for (var element in users) {
                        if (element[0]
                                .toLowerCase()
                                .startsWith(text.toLowerCase()) ||
                            element[1]
                                .toLowerCase()
                                .startsWith(text.toLowerCase())) {
                          usersSearch.add(element);
                        }
                      }
                    });
                  },
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controller.value.text.isEmpty
                    ? users.length
                    : usersSearch.length,
                itemBuilder: (_, index) => _buildFollowFirnt(
                  _controller.value.text.isEmpty
                      ? users[index][4]
                      : usersSearch[index][4],
                  name: _controller.value.text.isEmpty
                      ? users[index][0]
                      : usersSearch[index][0],
                  userName: _controller.value.text.isEmpty
                      ? users[index][1]
                      : usersSearch[index][1],
                  image: _controller.value.text.isEmpty
                      ? users[index][2]
                      : usersSearch[index][2],
                  isFollow: _controller.value.text.isEmpty
                      ? users[index][3]
                      : usersSearch[index][3],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFollowFirnt(index, {name, userName, image, isFollow}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
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
                  fontSize: 16,
                  color: Colors.grey[50],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                userName,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => setState(() {
              users[index][3] = !users[index][3];
            }),
            child: Container(
              width: 100,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isFollow ? Colors.blue[800] : Colors.grey[800],
                border: Border.all(
                  color: isFollow ? Colors.blue[800]! : Colors.grey[50]!,
                ),
              ),
              child: Center(
                child: Text(
                  isFollow ? "Unfollow" : "Follow",
                  style: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
