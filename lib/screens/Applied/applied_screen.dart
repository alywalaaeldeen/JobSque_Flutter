import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Models/applied_job.dart';
import 'package:jobsque/providers/jobs_provider.dart';

final jobNotifier =
    ChangeNotifierProvider<JobsProvider>((ref) => JobsProvider());
List<AppliedData> appliedJobs = [];

class AppliedScreen extends StatefulWidget {
  const AppliedScreen({super.key});

  @override
  State<AppliedScreen> createState() => _AppliedScreenState();
}

class _AppliedScreenState extends State<AppliedScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Applied Jobs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                        color: (index == 0)
                            ? Colors.blue.shade800
                            : Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      "Active",
                      style: TextStyle(
                          color: (index == 0)
                              ? Colors.white
                              : Colors.grey.shade600),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                        color: (index == 1)
                            ? Colors.blue.shade800
                            : Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      "Rejected",
                      style: TextStyle(
                          color: (index == 1)
                              ? Colors.white
                              : Colors.grey.shade600),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final jobChange = ref.watch(jobNotifier);
                  return FutureBuilder(
                    future: Future.delayed(Duration.zero, () async {
                      appliedJobs = await jobChange.getAppliedJobs();
                    }),
                    builder: (context, snapshot) {
                      return Expanded(
                        flex: 1,
                        child: ListView.builder(
                          itemCount: appliedJobs.length,
                          itemBuilder: (context, index) {
                            return AppliedJobItem(
                              appliedJob: appliedJobs[index],
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppliedJobItem extends StatefulWidget {
  const AppliedJobItem({
    super.key,
    required this.appliedJob,
  });
  final AppliedData appliedJob;

  @override
  State<AppliedJobItem> createState() => _AppliedJobItemState();
}

class _AppliedJobItemState extends State<AppliedJobItem> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const SizedBox(
            width: 40,
            height: 40,
            child: Icon(Icons.work_rounded),
          ),
          title: Text(widget.appliedJob.name ?? ""),
          subtitle: Text(
              ((widget.appliedJob.accept) ?? false ? "Accepted" : "Pending")),
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  isSaved = !isSaved;
                });
              },
              icon: (isSaved)
                  ? const Icon(
                      Icons.turned_in,
                      color: Colors.blue,
                    )
                  : const Icon(Icons.turned_in_not)),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                widget.appliedJob.workType ?? "",
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              alignment: Alignment.center,
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(25)),
              child: const Text(
                "Remote",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            const Text("Posted 2 Days Ago"),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade400)),
          width: 350,
          height: 80,
          child: Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.blue),
                        shape: BoxShape.circle),
                    child: const Text(
                      "1",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Box Data",
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        shape: BoxShape.circle),
                    child: Text(
                      "2",
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Type of Work",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        shape: BoxShape.circle),
                    child: Text(
                      "3",
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Upload Porfolio",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          width: 250,
          child: Divider(),
        )
      ],
    );
  }
}
