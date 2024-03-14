// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/Database/local_database.dart';
import 'package:jobsque/Models/applied_job.dart';
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

  Future<void> addToFavorites(int jobId) async {
    String token = await LocalDatabase.getToken() as String;

    final dio = Dio();

    await dio.post("https://project2.amit-learning.com/api/favorites",
        data: {"job_id": jobId},
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
          "Connection": "keep-alive"
        }));
  }

  Future<List<JobData>> getAllFavorites() async {
    List<JobData> favorites = [];
    String token = await LocalDatabase.getToken() as String;
    final dio = Dio();
    final response =
        await dio.get("https://project2.amit-learning.com/api/favorites",
            options: Options(headers: {
              "Authorization": "Bearer $token",
              "Accept": "application/json",
              "Connection": "keep-alive"
            }));
    if (response.data["status"]) {
      for (Map<String, dynamic> element
          in (response.data['data'] as List<dynamic>)) {
        favorites.add(JobData.fromJson(element));
      }
    }
    return [];
  }

  Future<List<AppliedData>> getAppliedJobs() async {
    List<AppliedData> appliedJobs = [];
    String token = await LocalDatabase.getToken() as String;
    final dio = Dio();
    final response =
        await dio.get("https://project2.amit-learning.com/api/apply/2",
            options: Options(headers: {
              "Authorization": "Bearer $token",
              "Accept": "application/json",
              "Connection": "keep-alive"
            }));

    if (response.data["status"]) {
      for (Map<String, dynamic> element
          in (response.data['data'] as List<dynamic>)) {
        appliedJobs.add(AppliedData.fromJson(element));
      }
      return appliedJobs;
    }
    return [];
  }
}
