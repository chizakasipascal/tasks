class Metadata {
  String? from;

  Metadata({this.from});

  Metadata.fromJson(Map<String, dynamic> json) {
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    return data;
  }
}
