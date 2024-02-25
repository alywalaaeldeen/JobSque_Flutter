import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/screens/HomeScreen/home_screen.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset("assets/images/Logo.svg"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 180,
              height: 140,
              child: SvgPicture.asset("assets/images/success.svg"),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Your Account has been set up!",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "We have customized feeds according to your preferences",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(
              height: 350,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                child: const Text("Get Started"))
          ],
        ),
      ),
    );
  }
}
