class AppliedJob {
  bool? status;
  List<AppliedData>? data;

  AppliedJob({this.status, this.data});

  AppliedJob.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AppliedData>[];
      json['data'].forEach((v) {
        data!.add(AppliedData.fromJson(v));
      });
    }
  }
}

class AppliedData {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? workType;
  String? cvFile;
  String? otherFile;
  int? jobsId;
  int? userId;
  int? reviewed;
  bool? accept;
  String? createdAt;
  String? updatedAt;

  AppliedData(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.workType,
      this.cvFile,
      this.otherFile,
      this.jobsId,
      this.userId,
      this.reviewed,
      this.accept,
      this.createdAt,
      this.updatedAt});

  AppliedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    workType = json['work_type'];
    cvFile = json['cv_file'];
    otherFile = json['other_file'];
    jobsId = json['jobs_id'];
    userId = json['user_id'];
    reviewed = json['reviewed'];
    accept = json['accept'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
