import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class Day29Screen extends StatefulWidget {
  const Day29Screen({Key? key}) : super(key: key);

  @override
  State<Day29Screen> createState() => _Day29ScreenState();
}

class _Day29ScreenState extends State<Day29Screen> {
  bool _onEditing = true;
  bool onCompleted = false;
  bool isCheckOTP = false;
  bool isStarteCheckOTP = false;
  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startCheckOTP() {
    timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        isStarteCheckOTP = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/day29/OTP.gif",
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                const SizedBox(height: 40),
                Text(
                  "Verification",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const SizedBox(height: 20),
                Text(
                  "Please enter this 6 digit code sent to\n+962-123-456-789",
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                _buildOTPField(),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't resive this OTP ?",
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Resend",
                      style: TextStyle(color: Colors.blue[900], fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: onCompleted ? Colors.black : Colors.grey,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if (onCompleted) {
                        setState(() {
                          isCheckOTP = true;
                        });
                        startCheckOTP();
                      }
                    },
                    child: Center(
                      child: buildContentButton(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContentButton() {
    if (!isCheckOTP) {
      return const Text(
        "Verify",
        style: TextStyle(color: Colors.white, fontSize: 18),
      );
    }

    if (isStarteCheckOTP) {
      return const Icon(
        Icons.check_circle,
        color: Colors.white,
      );
    }

    return CircularProgressIndicator(color: Colors.grey[50]);
  }

  _buildOTPField() {
    return VerificationCode(
      autofocus: true,
      textStyle: const TextStyle(fontSize: 20.0, color: Colors.black),
      keyboardType: TextInputType.number,

      underlineColor: Colors.grey[
          900], // If this is null it will use primaryColor: Colors.red from Theme
      length: 6,
      cursorColor:
          Colors.black, // If this is null it will default to the ambient

      onCompleted: (String value) {
        setState(() {
          onCompleted = true;
        });
      },
      digitsOnly: true,
      onEditing: (bool value) {
        setState(() {
          _onEditing = value;
        });
        if (!_onEditing) FocusScope.of(context).unfocus();
      },
    );
  }
}
