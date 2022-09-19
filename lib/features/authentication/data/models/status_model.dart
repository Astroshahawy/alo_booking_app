import 'package:alo_booking_app/features/authentication/domain/entities/status.dart';

class StatusModel extends Status {
  const StatusModel({
    required super.type,
    required super.messageAr,
    required super.messageEn,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      type: json['type'] ?? '0',
      messageAr:
          json['title'] != null ? json['title']['ar'] ?? 'empty' : 'empty',
      messageEn:
          json['title'] != null ? json['title']['en'] ?? 'empty' : 'empty',
    );
  }
}
