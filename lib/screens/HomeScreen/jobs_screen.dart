// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Models/jobs.dart';
import 'package:jobsque/providers/jobs_provider.dart';
import 'package:jobsque/screens/HomeScreen/recent_jobs.dart';
import 'package:jobsque/screens/HomeScreen/suggested_jobs_screen.dart';
import 'package:jobsque/screens/Job%20Detail/job_detail.dart';
import 'package:jobsque/screens/SearchScreens/search_screen.dart';

final jobNotifier =
    ChangeNotifierProvider<JobsProvider>((ref) => JobsProvider());

class JobsScreen extends StatelessWidget {
  JobsScreen({super.key});
  Job? sj;
  List<JobData>? jobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi, User",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Create a better future for yourself here",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
            style: IconButton.styleFrom(
                shape: CircleBorder(
                    side: BorderSide(color: Colors.grey.shade500))),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Column(children: [
              Form(
                child: SizedBox(
                    height: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SearchScreen(
                                isSearched: false, isfound: false)));
                      },
                      child: Container(
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.search),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text("Search....",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey.shade700))
                          ],
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Suggested Jobs",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SuggestedJobsScreen()));
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ))
                ],
              ),
              Expanded(
                child: SizedBox(
                    height: 180,
                    child: Consumer(builder: (context, ref, _) {
                      final jobChange = ref.watch(jobNotifier);

                      Future.delayed(Duration.zero, () async {
                        sj ??= await jobChange.getSJobs();
                      });
                      return PageView(children: [
                        SuggestedJobItem(
                          suggestedJob: sj,
                        ),
                      ]);
                    })),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Job",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const RecentJobsScreen())));
                      },
                      child: const Text("View all"))
                ],
              ),
            ]),
          ),
          Consumer(builder: (context, ref, _) {
            final jobChange = ref.watch(jobNotifier);
            Future.delayed(Duration.zero, () async {
              jobs ??= await jobChange.getAllJobs();
            });
            return Expanded(
              flex: 1,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: jobs!.length,
                  itemBuilder: (context, index) {
                    return RecentJobItem(
                      recentJob: jobs![index],
                    );
                  }),
            );
          }),
        ]),
      ),
    );
  }
}

class SuggestedJobItem extends StatefulWidget {
  const SuggestedJobItem({
    super.key,
    required this.suggestedJob,
  });
  final Job? suggestedJob;

  @override
  State<SuggestedJobItem> createState() => _SuggestedJobItemState();
}

class _SuggestedJobItemState extends State<SuggestedJobItem> {
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.shade800, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.network(widget.suggestedJob?.data.image ?? "")),
            ),
            title: Text(
              widget.suggestedJob?.data.name ?? "",
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              widget.suggestedJob?.data.compName ?? "",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  isfavorite = !isfavorite;
                });
              },
              icon: (!isfavorite)
                  ? const Icon(
                      Icons.turned_in_not_rounded,
                      color: Colors.white,
                      size: 30,
                    )
                  : const Icon(
                      Icons.turned_in_rounded,
                      color: Colors.white,
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
                width: 90,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white70,
                ),
                child: Text(
                  widget.suggestedJob?.data.jobTimeType ?? "",
                  textHeightBehavior: const TextHeightBehavior(
                      leadingDistribution: TextLeadingDistribution.even),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 90,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white70,
                ),
                child: const Text(
                  "Remote",
                  textHeightBehavior: TextHeightBehavior(
                      leadingDistribution: TextLeadingDistribution.even),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 90,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white70,
                ),
                child: const Text(
                  "Design",
                  textHeightBehavior: TextHeightBehavior(
                      leadingDistribution: TextLeadingDistribution.even),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: "${widget.suggestedJob?.data.salary}K  "),
                  const TextSpan(
                      text: "/Month",
                      style: TextStyle(fontSize: 12, color: Colors.white70))
                ], style: const TextStyle(color: Colors.white, fontSize: 22)),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => JobDetail(
                              job: widget.suggestedJob?.data,
                            ))));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  child: const Text("Apply Now"))
            ],
          )
        ],
      ),
    );
  }
}

class RecentJobItem extends StatefulWidget {
  const RecentJobItem({
    super.key,
    required this.recentJob,
  });
  final JobData recentJob;

  @override
  State<RecentJobItem> createState() => _RecentJobItemState();
}

class _RecentJobItemState extends State<RecentJobItem> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => JobDetail(job: widget.recentJob))));
      },
      child: Padding(
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
                    child: Image.network(widget.recentJob.image)),
              ),
              title: Text(
                widget.recentJob.name,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              subtitle: Text(
                widget.recentJob.compName,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: (isFavorite == false)
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
                  child: Text(
                    widget.recentJob.jobTimeType,
                    style: const TextStyle(color: Colors.blue),
                    textHeightBehavior: const TextHeightBehavior(
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
                  child: Text(
                    widget.recentJob.jobType,
                    style: const TextStyle(color: Colors.blue),
                    textHeightBehavior: const TextHeightBehavior(
                        leadingDistribution: TextLeadingDistribution.even),
                    textAlign: TextAlign.center,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "${widget.recentJob.salary}K"),
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
          ])),
    );
  }
}
