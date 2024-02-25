import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Saved"),
      ),
      body: ListView(children: const [
        Column(
          children: [
            SavedItem(
              jobName: "Senior UI Designer",
              jobLogo: "assets/images/zoom.svg",
              companyAndLocation: "Zoom • Jakarta, Indonesia ",
            ),
            SavedItem(
              jobName: "UI Designer",
              jobLogo: "assets/images/google.svg",
              companyAndLocation: "Google • Chicago, USA ",
            ),
          ],
        )
      ]),
    );
  }
}

class SavedItem extends StatelessWidget {
  const SavedItem(
      {super.key,
      required this.jobName,
      required this.jobLogo,
      required this.companyAndLocation});
  final String jobName;
  final String jobLogo;
  final String companyAndLocation;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          SizedBox(width: 40, height: 40, child: SvgPicture.asset(jobLogo)),
      title: Text(jobName),
      subtitle: Text(companyAndLocation),
      trailing: IconButton(
          onPressed: () {
            showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 310,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 330,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: Colors.grey.shade500)),
                                child: const ListTile(
                                  leading: Icon(Icons.add_chart_rounded),
                                  title: Text("Apply Job"),
                                  trailing: Icon(Icons.chevron_right),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 330,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: Colors.grey.shade500)),
                                child: const ListTile(
                                  leading: Icon(Icons.share),
                                  title: Text("Share via"),
                                  trailing: Icon(Icons.chevron_right),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 330,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: Colors.grey.shade500)),
                                child: const ListTile(
                                  leading: Icon(Icons.turned_in_rounded),
                                  title: Text("Cancel save"),
                                  trailing: Icon(Icons.chevron_right),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.more_horiz_outlined)),
    );
  }
}
