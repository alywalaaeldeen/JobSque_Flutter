// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Models/jobs.dart';
import 'package:jobsque/providers/jobs_provider.dart';
import 'package:jobsque/screens/Job%20Detail/job_detail.dart';

final jobNotifier =
    ChangeNotifierProvider<JobsProvider>((ref) => JobsProvider());

class SavedScreen extends StatelessWidget {
  SavedScreen({super.key});
  List<JobData> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Saved"),
      ),
      body: Column(children: [
        Expanded(
          child: Consumer(builder: (context, ref, child) {
            final jobChange = ref.watch(jobNotifier);
            Future.delayed(Duration.zero, () async {
              favorites = await jobChange.getAllJobs();
            });
            if (favorites.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return SavedItem(
                    savedItem: favorites[index],
                  );
                },
              );
            }
          }),
        )
      ]),
    );
  }
}

class SavedItem extends StatelessWidget {
  const SavedItem({
    super.key,
    required this.savedItem,
  });
  final JobData savedItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => JobDetail(job: savedItem)));
      },
      child: ListTile(
        leading: SizedBox(
            width: 40, height: 40, child: Image.network(savedItem.image)),
        title: Text(savedItem.name),
        subtitle: Text(savedItem.compName),
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
      ),
    );
  }
}
