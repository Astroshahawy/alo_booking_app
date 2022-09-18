import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final String type;
  final String messageAr;
  final String messageEn;

  const Status({
    required this.type,
    required this.messageAr,
    required this.messageEn,
  });

  @override
  List<Object> get props => [type, messageAr, messageEn];
}
