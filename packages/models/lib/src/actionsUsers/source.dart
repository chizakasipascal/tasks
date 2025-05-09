import 'actionsUsers.dart';

class Source {
  String? type;
  String? name;
  Metadata? metadata;

  Source({this.type, this.name, this.metadata});

  Source.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    return data;
  }
}
