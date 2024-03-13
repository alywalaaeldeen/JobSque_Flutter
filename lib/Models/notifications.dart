class NotificationModel {
  bool? status;
  Data? data;

  NotificationModel({this.status, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? userId;
  String? compId;
  String? compName;
  String? userName;
  String? lastMassage;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.compId,
      this.compName,
      this.userName,
      this.lastMassage,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    compId = json['comp_id'];
    compName = json['comp_name'];
    userName = json['user_name'];
    lastMassage = json['last_massage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
