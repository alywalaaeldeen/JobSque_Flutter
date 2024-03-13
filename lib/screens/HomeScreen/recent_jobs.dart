// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Models/jobs.dart';
import 'package:jobsque/providers/jobs_provider.dart';
import 'package:jobsque/screens/HomeScreen/jobs_screen.dart';

final jobNotifier =
    ChangeNotifierProvider<JobsProvider>((ref) => JobsProvider());

class RecentJobsScreen extends StatelessWidget {
  const RecentJobsScreen({super.key});
  static List<JobData> jobs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Recent Jobs"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(builder: (context, ref, _) {
              final jobChange = ref.watch(jobNotifier);
              Future.delayed(Duration.zero, () async {
                jobs = await jobChange.getAllJobs();
              });
              if (jobs.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      return RecentJobItem(
                        recentJob: jobs[index],
                      );
                    });
              }
            }),
          ),
        ],
      ),
    );
  }
}
