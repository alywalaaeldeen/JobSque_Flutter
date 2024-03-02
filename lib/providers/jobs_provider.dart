import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Models/suggested_job.dart';

final jobsprovider = ChangeNotifierProvider<JobsProvider>(
  (ref) => JobsProvider(),
);

class JobsProvider extends ChangeNotifier {
  Future<SuggestedJob> getSJobs() async {
    SuggestedJob sj;

    final dio = Dio();
    final response =
        await dio.get("https://project2.amit-learning.com/api/jobs/sugest/");
    sj = SuggestedJob(
        status: response.data["status"], data: response.data["data"]);
    return sj;
  }
}
