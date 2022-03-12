import 'package:flutter/material.dart';

class Day24Screen extends StatelessWidget {
  const Day24Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  "Hello,\nWelcome Back",
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Image.asset(
                        "assets/images/day24/google.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      child: Image.asset(
                        "assets/images/day24/facebook.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                buildLoginField(context, hint: "Email or Phone numpur"),
                const SizedBox(height: 10),
                buildLoginField(context, hint: "Password", isPass: true),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(height: 60),
                buildLoginButton(
                  context,
                  text: "Login",
                  background: Theme.of(context).primaryColor,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 10),
                buildLoginButton(
                  context,
                  text: "Create account",
                  background: Theme.of(context).backgroundColor,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildLoginButton(context, {text, background, style, onPressed}) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }

  Container buildLoginField(context, {hint, isPass = false}) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColorLight,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
        obscureText: isPass,
        style: Theme.of(context).textTheme.headline3!.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}
