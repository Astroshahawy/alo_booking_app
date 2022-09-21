import 'package:equatable/equatable.dart';

import 'hotel.dart';

class HotelsData extends Equatable {
  final List<Hotel> data;

  const HotelsData({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}
