import 'package:firebase_auth_verification/screens/otp_verify.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/primary_buttons.dart';

class Registered extends StatefulWidget {
  const Registered({super.key});

  @override
  State<Registered> createState() => _RegisteredState();
}

class _RegisteredState extends State<Registered> {
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  final auth = FirebaseAuth.instance;
  var phone = "";
  Country selectedcountry = Country(
    phoneCode: "977",
    countryCode: "NP",
    e164Sc: 1,
    geographic: true,
    level: 1,
    name: "Nepal",
    example: "Nepal",
    displayName: "Nepal",
    displayNameNoCountryCode: "Nepal",
    e164Key: "",
  );

  @override
  void dispose() {
    phonecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    "https://img.freepik.com/free-vector/two-businessmen-shaking-hands-other-man-taking-photo_74855-11153.jpg?w=1380&t=st=1698910668~exp=1698911268~hmac=87d3e981287c23550653e69b6a83b20b42b7a2cad03dc6796c7f857874f66cfa",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              10.heightBox,
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: VxTextField(
              //     fillColor: Colors.white70,
              //     prefixIcon: const Icon(Icons.email),
              //     hint: "Email",
              //     controller: emailcontroller,
              //     borderRadius: BorderSide.strokeAlignCenter,
              //   ),
              // ),
              // 15.heightBox,
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: VxTextField(
              //     isPassword: true,
              //     fillColor: Colors.purple.shade100,
              //     prefixIcon: const Icon(Icons.password_sharp),
              //     hint: "Password",
              //     controller: passwordcontroller,
              //     borderRadius: BorderSide.strokeAlignCenter,
              //   ),
              // ),
              // 20.heightBox,
              // PrimaryButtons(
              //     text: "Registered", onpressed: () {}, color: Colors.purple),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: VxTextField(
                  style: const TextStyle(fontSize: 18),
                  clear: false,
                  keyboardType: TextInputType.phone,
                  prefixIcon: InkWell(
                    onTap: () {
                      showCountryPicker(
                          countryListTheme: const CountryListThemeData(
                              flagSize: 20, bottomSheetHeight: 550),
                          context: context,
                          onSelect: (clickdata) {
                            setState(() {
                              selectedcountry = clickdata;
                            });
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${selectedcountry.flagEmoji} + ${selectedcountry.phoneCode} ",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  fillColor: Colors.white,
                  borderType: VxTextFieldBorderType.roundLine,
                  borderColor: Colors.black,
                  controller: phonecontroller,
                  hint: "Enter Phone Number",
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                ),
              ),
              15.heightBox,
              PrimaryButtons(
                  text: "Send OTP",
                  onpressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${selectedcountry.countryCode + phone}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Otp(verificationId: verificationId),
                          ),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
