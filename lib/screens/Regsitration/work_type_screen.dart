import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/screens/Regsitration/work_location_screen.dart';

class WorkType extends StatefulWidget {
  const WorkType({super.key});

  @override
  State<WorkType> createState() => _WorkTypeState();
}

class _WorkTypeState extends State<WorkType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
        child: ListView(children: [
          Column(
            children: [
              const Text(
                "What type of work are you interested in?",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                "Tell us what you’re interested in so we can customise the app for your needs",
                style: TextStyle(color: Colors.grey.shade700),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  WorkTypeItem(
                      jobTitle: "UI/UX Designer",
                      icon: "assets/icons/bezier.svg"),
                  SizedBox(
                    width: 15,
                  ),
                  WorkTypeItem(
                      jobTitle: "Illustrator Designer",
                      icon: "assets/icons/Ilustrator Category.svg"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  WorkTypeItem(
                      jobTitle: "Developer",
                      icon: "assets/icons/Developer Category.svg"),
                  SizedBox(
                    width: 15,
                  ),
                  WorkTypeItem(
                      jobTitle: "Management",
                      icon: "assets/icons/Management Category.svg"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  WorkTypeItem(
                      jobTitle: "Information Technology",
                      icon: "assets/icons/Information technology category.svg"),
                  SizedBox(
                    width: 15,
                  ),
                  WorkTypeItem(
                      jobTitle: "Research and Analytics",
                      icon: "assets/icons/Research and Analytics category.svg"),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WorkLocationScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 50),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  child: const Text("Next"))
            ],
          ),
        ]),
      ),
    );
  }
}

class WorkTypeItem extends StatefulWidget {
  const WorkTypeItem({super.key, required this.jobTitle, required this.icon});
  final String jobTitle;
  final String icon;

  @override
  State<WorkTypeItem> createState() => _WorkTypeItemState();
}

class _WorkTypeItemState extends State<WorkTypeItem> {
  bool selectedTile = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 156,
      height: 125,
      child: ListTile(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        selected: selectedTile,
        onTap: () {
          setState(() {
            selectedTile = !selectedTile;
          });
        },
        selectedColor: Colors.blue,
        selectedTileColor: Colors.grey.shade200,
        tileColor: Colors.grey.shade200,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              widget.icon,
              height: 48,
              width: 48,
            ),
            Text(widget.jobTitle),
          ],
        ),
      ),
    );
  }
}
