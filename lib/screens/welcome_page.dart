import 'package:firebase_auth_verification/Widgets/Primary_buttons.dart';
import 'package:firebase_auth_verification/screens/registered.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                "https://cdn.dribbble.com/users/1889528/screenshots/7239609/0aba6579301149.5cbf290c5a8dd.jpg",
                height: 300,
              ),
              // 10.heightBox,
              "Let`s get started the final Login"
                  .text
                  .size(20)
                  .fontWeight(FontWeight.w300)
                  .make(),
              10.heightBox,
              PrimaryButtons(
                color: Colors.purple,
                text: "Login",
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Registered(),
                    ),
                  );
                },
              ),
              15.heightBox,
              PrimaryButtons(
                color: const Color.fromARGB(255, 189, 16, 73),
                text: "Registered",
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Registered(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
