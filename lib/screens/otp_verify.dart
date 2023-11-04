import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_verification/screens/home_screen.dart';
import 'package:firebase_auth_verification/widgets/primary_buttons.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';

class Otp extends StatefulWidget {
  final String verificationId;
  const Otp({super.key, required this.verificationId});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController pincontroller = TextEditingController();

  final auth = FirebaseAuth.instance;
  var code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            105.heightBox,
            Center(
              child: Pinput(
                onChanged: (value) {
                  setState(() {
                    code = value;
                  });
                },
                length: 6,
                controller: pincontroller,
              ),
            ),
            20.heightBox,
            PrimaryButtons(
                text: "Verified",
                onpressed: () async {
                  try {
                    // Create a PhoneAuthCredential with the code
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: code);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()));
                  } catch (e) {}
                },
                color: Colors.red)
          ],
        )),
      ),
    );
  }
}
