import 'package:flutter/material.dart';

class Day28Screen extends StatefulWidget {
  const Day28Screen({Key? key}) : super(key: key);

  @override
  State<Day28Screen> createState() => _Day28ScreenState();
}

class _Day28ScreenState extends State<Day28Screen> {
  final TextEditingController _controller = TextEditingController();
  bool _isVisible = true;
  bool isContainsCharacters = false;
  bool isContainsNumber = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Create Your Account",
          style: TextStyle(
            color: Colors.grey[900],
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Your Account",
                style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Please create a secure password including the following criteria below.",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: 50,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[700]!, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextField(
                  obscureText: _isVisible,
                  controller: _controller,
                  style: TextStyle(color: Colors.grey[800], fontSize: 14),
                  onChanged: (String text) {
                    final numericRegex = RegExp(r'[0-9]');
                    isContainsCharacters = false;
                    isContainsNumber = false;
                    setState(() {
                      if (text.length > 7) {
                        isContainsCharacters = true;
                      }
                      if (numericRegex.hasMatch(text)) {
                        isContainsNumber = true;
                      }
                    });
                  },
                  cursorColor: Colors.grey[900],
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle:
                          TextStyle(color: Colors.grey[800], fontSize: 14),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ),
                      )),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: isContainsCharacters ? Colors.green : Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Contains at least 8 characters",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: isContainsNumber ? Colors.green : Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Contains at least 1 Number",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Container(
                height: 50,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Center(
                      child: Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
