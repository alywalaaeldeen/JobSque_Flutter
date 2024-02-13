import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/Login/login_screen.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Stack(alignment: Alignment.center, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/passwordChanged.svg"),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Password changed succesfully!",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Your password has been changed successfully, we will let you know if there are more problems with your account",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 300,
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(350, 50)),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
