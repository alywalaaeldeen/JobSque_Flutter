import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Models/jobs.dart';
import 'package:jobsque/screens/HomeScreen/jobs_screen.dart';

class SuggestedJobsScreen extends StatelessWidget {
  SuggestedJobsScreen({super.key});
  Job? suggestedJob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Suggested Jobs"),
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, _) {
              final jobChange = ref.watch(jobNotifier);
              Future.delayed(Duration.zero, () async {
                suggestedJob = await jobChange.getSJobs();
              });
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SuggestedJobItem(
                  suggestedJob: suggestedJob,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
