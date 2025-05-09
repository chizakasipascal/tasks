import 'actionsUsers.dart';

class Points {
  String? id;
  String? name;
  String? note;
  String? status;
  Source? source;
  Date? date;
  String? dueWhen;
  String? createdDate;
  String? lastUpdated;
  int? timestamp;
  List<Null>? subPoint;
  bool? isTodayTask;
  bool? isLastUpdateToday;

  Points(
      {this.id,
      this.name,
      this.note,
      this.status,
      this.source,
      this.date,
      this.dueWhen,
      this.createdDate,
      this.lastUpdated,
      this.timestamp,
      this.subPoint,
      this.isTodayTask,
      this.isLastUpdateToday});

  Points.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    note = json['note'];
    status = json['status'];
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    date = json['date'] != null ? new Date.fromJson(json['date']) : null;
    dueWhen = json['dueWhen'];
    createdDate = json['createdDate'];
    lastUpdated = json['lastUpdated'];
    timestamp = json['timestamp'];
    isTodayTask = json['isTodayTask'];
    isLastUpdateToday = json['isLastUpdateToday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['note'] = this.note;
    data['status'] = this.status;
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    data['dueWhen'] = this.dueWhen;
    data['createdDate'] = this.createdDate;
    data['lastUpdated'] = this.lastUpdated;
    data['timestamp'] = this.timestamp;

    data['isTodayTask'] = this.isTodayTask;
    data['isLastUpdateToday'] = this.isLastUpdateToday;
    return data;
  }
}
