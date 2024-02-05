import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/Regsitration/create_account.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

List<String> images = [
  "assets/images/Background.svg",
  "assets/images/Background2.svg",
  "assets/images/Background3.svg"
];
List<String> titleLeadings = [
  "Find a job, and ",
  "Hundreds of jobs are waiting for you to ",
  "Get the best "
];
List<String> coloredTitles = [
  "start building ",
  "join together ",
  "choice for the job "
];
List<String> titleTrailings = [
  "and your career from now on",
  "",
  "you've always dreamed of"
];
List<String> subtitles = [
  "Explore over 25,924 available job roles and upgrade your operator now.",
  "Immediately join us and start applying for the job you are interested in.",
  "The better the skills you have, the greater the good job opportunities for you."
];
final controller = PageController();
List<OnBoardingItem> pages = [
  OnBoardingItem(
    index: 0,
    imageName: images[0],
    leadingTitle: titleLeadings[0],
    coloredTitle: coloredTitles[0],
    trailingTitle: titleTrailings[0],
    subtitle: subtitles[0],
  ),
  OnBoardingItem(
    index: 1,
    imageName: images[1],
    leadingTitle: titleLeadings[1],
    coloredTitle: coloredTitles[1],
    trailingTitle: titleTrailings[1],
    subtitle: subtitles[1],
  ),
  OnBoardingItem(
    index: 2,
    imageName: images[2],
    leadingTitle: titleLeadings[2],
    coloredTitle: coloredTitles[2],
    trailingTitle: titleTrailings[2],
    subtitle: subtitles[2],
  ),
];

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          "assets/images/Logo.svg",
          width: 40,
          height: 30,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateAccount()));
              },
              child: const Text("Skip"))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
              height: 600,
              child: PageView(
                controller: controller,
                children: pages,
              )),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (controller.page!.toInt() != 2) {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const CreateAccount()),
                      (route) => false);
                }
              });
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 50),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white),
            child: const Text("Next"),
          )
        ],
      ),
    );
  }
}

class OnBoardingItem extends StatefulWidget {
  const OnBoardingItem({
    super.key,
    required this.imageName,
    required this.leadingTitle,
    required this.coloredTitle,
    required this.trailingTitle,
    required this.subtitle,
    required this.index,
  });
  final String imageName, leadingTitle, coloredTitle, trailingTitle, subtitle;
  final int index;

  @override
  State<OnBoardingItem> createState() => _OnBoardingItemState();
}

class _OnBoardingItemState extends State<OnBoardingItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 350,
            width: 300,
            child: SvgPicture.asset(
              images[widget.index],
              width: double.infinity,
              height: 500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 32, color: Colors.black),
              children: [
                TextSpan(text: titleLeadings[widget.index]),
                TextSpan(
                    text: coloredTitles[widget.index],
                    style: const TextStyle(fontSize: 32, color: Colors.blue)),
                TextSpan(text: titleTrailings[widget.index]),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitles[widget.index],
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(
                  dotHeight: 8, dotWidth: 8, activeDotColor: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
