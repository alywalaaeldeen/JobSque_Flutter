class SuggestedJob {
  final bool status;
  final JobData data;

  SuggestedJob({required this.status, required this.data});

  factory SuggestedJob.fromJson(Map<String, dynamic> json) => SuggestedJob(
        status: json['status'] as bool,
        data: JobData.fromJson(json['data'] as Map<String, dynamic>),
      );
}

class JobData {
  final int id;
  final String name;
  final String image;
  final String jobTimeType;
  final String jobType;
  final String jobLevel;
  final String jobDescription;
  final String jobSkill;
  final String compName;
  final String compEmail;
  final String compWebsite;
  final String aboutComp;
  final String location;
  final String salary;
  final int favorites;
  final int expired;
  final DateTime createdAt;
  final DateTime updatedAt;

  JobData({
    required this.id,
    required this.name,
    required this.image,
    required this.jobTimeType,
    required this.jobType,
    required this.jobLevel,
    required this.jobDescription,
    required this.jobSkill,
    required this.compName,
    required this.compEmail,
    required this.compWebsite,
    required this.aboutComp,
    required this.location,
    required this.salary,
    required this.favorites,
    required this.expired,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JobData.fromJson(Map<String, dynamic> json) => JobData(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
        jobTimeType: json['job_time_type'] as String,
        jobType: json['job_type'] as String,
        jobLevel: json['job_level'] as String,
        jobDescription: json['job_description'] as String,
        jobSkill: json['job_skill'] as String,
        compName: json['comp_name'] as String,
        compEmail: json['comp_email'] as String,
        compWebsite: json['comp_website']  as String,
        aboutComp: json['about_comp'] as String,
        location: json['location'] as String,
        salary: json['salary'] as String,
        favorites: json['favorites'] as int,
        expired: json['expired'] as int,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );
}
