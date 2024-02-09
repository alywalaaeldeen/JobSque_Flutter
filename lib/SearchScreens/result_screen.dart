import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_alt_rounded)),
                const FilterItem(),
                const SizedBox(
                  width: 10,
                ),
                const FilterItem(),
              ],
            ),
          ),
          const SingleChildScrollView(
            child: Column(
              children: [
                //replace the static values with real ones retrieved from API.
                ResultItem(
                    jobName: "UI/UX Designer",
                    companyLogo: "assets/images/twitter.svg",
                    companyAndLocation: "Twitter • Jakarta, Indonesia "),
                ResultItem(
                    jobName: "UI/UX Designer",
                    companyLogo: "assets/images/twitter.svg",
                    companyAndLocation: "Twitter • Jakarta, Indonesia "),
                ResultItem(
                    jobName: "UI/UX Designer",
                    companyLogo: "assets/images/twitter.svg",
                    companyAndLocation: "Twitter • Jakarta, Indonesia "),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FilterItem extends StatefulWidget {
  const FilterItem({super.key});

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 88,
      height: 32,
      decoration: BoxDecoration(
          color: Colors.blue.shade800, borderRadius: BorderRadius.circular(20)),
      child: DropdownButton(
        underline: const SizedBox(),
        dropdownColor: Colors.blue.shade800,
        iconEnabledColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
        items: const [
          DropdownMenuItem(
              child: Text(
            "Full time",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ))
        ],
        onChanged: (newValue) {},
      ),
    );
  }
}

class ResultItem extends StatefulWidget {
  const ResultItem(
      {super.key,
      required this.jobName,
      required this.companyLogo,
      required this.companyAndLocation});
  final String jobName;
  final String companyLogo;
  final String companyAndLocation;

  @override
  State<ResultItem> createState() => _ResultItemState();
}

class _ResultItemState extends State<ResultItem> {
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 102, 144, 255),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: SizedBox(
                width: 32,
                height: 32,
                child: SvgPicture.asset(widget.companyLogo)),
          ),
          title: Text(
            widget.jobName,
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
          ),
          subtitle: Text(
            widget.companyAndLocation,
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                isfavorite = !isfavorite;
              });
            },
            icon: (isfavorite == false)
                ? const Icon(
                    Icons.turned_in_not_rounded,
                    color: Colors.black,
                    size: 30,
                  )
                : const Icon(
                    Icons.turned_in_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.shade100,
              ),
              child: const Text(
                "Fulltime",
                style: TextStyle(color: Colors.blue),
                textHeightBehavior: TextHeightBehavior(
                    leadingDistribution: TextLeadingDistribution.even),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.shade100,
              ),
              child: const Text(
                "Remote",
                style: TextStyle(color: Colors.blue),
                textHeightBehavior: TextHeightBehavior(
                    leadingDistribution: TextLeadingDistribution.even),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.shade100,
              ),
              child: const Text(
                "Design",
                style: TextStyle(color: Colors.blue),
                textHeightBehavior: TextHeightBehavior(
                    leadingDistribution: TextLeadingDistribution.even),
                textAlign: TextAlign.center,
              ),
            ),
            RichText(
              text: TextSpan(
                  children: [
                    const TextSpan(
                        text:
                            "\$15K"), // exchange static value with the real value retrieved from API
                    TextSpan(
                        text: "/Month",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12))
                  ],
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
