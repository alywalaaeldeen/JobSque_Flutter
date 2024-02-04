import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WorkLocationScreen extends StatelessWidget {
  const WorkLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: SvgPicture.asset(
      //     "assets/images/Logo.svg",
      //     width: 40,
      //     height: 30,
      //   ),
      // ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 60),
        child: Column(
          children: [
            const Text(
              "Where are your prefered location?",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Let us know, where is the work location you want at this time, so we can adjust it.",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            )
          ],
        ),
      ),
    );
  }
}
