import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_design_day_21_30/day30/model/job.dart';

class Day30Screen extends StatefulWidget {
  const Day30Screen({Key? key}) : super(key: key);

  @override
  State<Day30Screen> createState() => _Day30ScreenState();
}

class _Day30ScreenState extends State<Day30Screen> {
  List<dynamic> jobs = [];

  Future<void> readJson() async {
    final String responsr =
        await rootBundle.loadString("assets/images/day30/jobs.json");
    final data = await json.decode(responsr);
    setState(() {
      jobs = data["jobs"].map((data) => Job.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    super.initState();

    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey[500],
          ),
        ),
        title: Container(
          height: 40,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search e.g Software Developer",
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ),
        actions: [
          Icon(
            Icons.notifications_outlined,
            color: Colors.grey[400],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        itemCount: jobs.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) => AnimationWidget(
          child: buildItmeSoftware(job: jobs[index]),
        ),
      ),
    );
  }

  buildItmeSoftware({required Job job}) {
    return Container(
      width: double.infinity,
      // height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(job.companyLogo),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    job.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey[900], fontWeight: FontWeight.bold),
                  ),
                  Text(
                    job.address,
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    job.isMyFav = !job.isMyFav;
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                        color:
                            job.isMyFav ? Colors.red[600]! : Colors.grey[400]!),
                  ),
                  child: Center(
                    child: Icon(
                      job.isMyFav ? Icons.favorite : Icons.favorite_outline,
                      color: job.isMyFav ? Colors.red[600]! : Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Text(
                    job.type,
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(int.parse("0xff${job.experienceLevelColor}"))
                      .withAlpha(20),
                ),
                child: Center(
                  child: Text(
                    job.experienceLevel,
                    style: TextStyle(
                        color: Color(
                            int.parse("0xff${job.experienceLevelColor}"))),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                job.timeAgo,
                style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  final Widget child;
  const AnimationWidget({required this.child, Key? key}) : super(key: key);

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween<double>(begin: -50, end: 0).animate(controller);
    animation.addListener(() {
      setState(() {});
    });

    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, animation.value),
      child: widget.child,
    );
  }
}
