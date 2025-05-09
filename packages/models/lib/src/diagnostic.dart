import 'package:equatable/equatable.dart';

class Diagnostic extends Equatable {
  final String message;
  final int status;
  final String? vouchercode;

  const Diagnostic(
      {this.vouchercode, required this.status, required this.message});

  @override
  List<Object> get props => [message, status];

  factory Diagnostic.fromJson(Map<String, dynamic> json) {
    return Diagnostic(
      message: json['message'] as String,
      status: json['status'] as int,
      vouchercode: json['voucher_code'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "voucher_code": vouchercode,
      };

  @override
  String toString() {
    return 'Diagnostic{ status: $status,message: $message,voucher_code: $vouchercode,}';
  }
}
