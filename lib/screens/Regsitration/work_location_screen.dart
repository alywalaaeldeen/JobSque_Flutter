import 'package:flutter/material.dart';
import 'package:jobsque/screens/Regsitration/final_screen.dart';

class WorkLocationScreen extends StatelessWidget {
  const WorkLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Select the country you want for your job",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Wrap(
              spacing: 8,
              runSpacing: 20,
              children: [
                CountryItem(
                    countryName: "United States",
                    countryPath: "assets/countries/unitedstates.png"),
                CountryItem(
                    countryName: "Malaysia",
                    countryPath: "assets/countries/malaysia.png"),
                CountryItem(
                    countryName: "Singapore",
                    countryPath: "assets/countries/singapore.png"),
                CountryItem(
                    countryName: "Indonesia",
                    countryPath: "assets/countries/indonesia.png"),
                CountryItem(
                    countryName: "Philiphines",
                    countryPath: "assets/countries/philiphines.png"),
                CountryItem(
                    countryName: "Poland",
                    countryPath: "assets/countries/poland.png"),
                CountryItem(
                    countryName: "India",
                    countryPath: "assets/countries/india.png"),
                CountryItem(
                    countryName: "Vietnam",
                    countryPath: "assets/countries/vietnam.png"),
                CountryItem(
                    countryName: "China",
                    countryPath: "assets/countries/china.png"),
                CountryItem(
                    countryName: "Canada",
                    countryPath: "assets/countries/canada.png"),
                CountryItem(
                    countryName: "Saudi Arabia",
                    countryPath: "assets/countries/saudiarabia.png"),
                CountryItem(
                    countryName: "Argentina",
                    countryPath: "assets/countries/argentina.png"),
                CountryItem(
                    countryName: "Brazil",
                    countryPath: "assets/countries/brazil.png"),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FinalScreen()));
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                child: const Text("Next"))
          ],
        ),
      ),
    );
  }
}

class CountryItem extends StatefulWidget {
  const CountryItem(
      {super.key, required this.countryName, required this.countryPath});
  final String countryName;
  final String countryPath;

  @override
  State<CountryItem> createState() => _CountryItemState();
}

class _CountryItemState extends State<CountryItem> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          //Code to add the country
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
            color: (selected) ? Colors.blue : Colors.grey.shade400,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              widget.countryPath,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(widget.countryName)
          ],
        ),
      ),
    );
  }
}
