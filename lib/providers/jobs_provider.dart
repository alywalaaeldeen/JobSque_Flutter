// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/Database/local_database.dart';
import 'package:jobsque/Models/jobs.dart';

class JobsProvider extends ChangeNotifier {
  Future<Job?> getSJobs() async {
    Job? sj;
    String token = await LocalDatabase.getToken() as String;

    final dio = Dio();
    final response =
        await dio.get("https://project2.amit-learning.com/api/jobs/sugest/2",
            options: Options(headers: {
              "Authorization": "Bearer $token",
              "Accept": "application/json",
              "Connection": "keep-alive"
            }));

    if (response.data["status"]) {
      sj = Job.fromJson(response.data);
      notifyListeners();
      return sj;
    }
    return null;
  }

  Future<List<JobData>> getAllJobs() async {
    String token = await LocalDatabase.getToken() as String;
    List<JobData> jobs = [];
    final dio = Dio();
    final response =
        await dio.get("https://project2.amit-learning.com/api/jobs/",
            options: Options(headers: {
              "Authorization": "Bearer $token",
              "Accept": "application/json",
              "Connection": "keep-alive"
            }));

    if (response.data["status"]) {
      for (Map<String, dynamic> element
          in (response.data['data'] as List<dynamic>)) {
        jobs.add(JobData.fromJson(element));
      }
      return jobs;
    }
    return [];
  }
}
