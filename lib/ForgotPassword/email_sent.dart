import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/ForgotPassword/change_password.dart';
import 'package:jobsque/HomeScreen/home_screen.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Apply job")),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/emailSent.svg"),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Check your Email",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "We have sent a reset password to your email address",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 250,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const ChangePasswordScreen()),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    backgroundColor: Colors.blue),
                child: const Text(
                  "Change password",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))
          ],
        ),
      )),
    );
  }
}
