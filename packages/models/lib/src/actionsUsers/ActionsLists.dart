import 'actionsUsers.dart';

class ActionsListsForUsers {
  String? message;
  Data? data;

  ActionsListsForUsers({this.message, this.data});

  ActionsListsForUsers.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
