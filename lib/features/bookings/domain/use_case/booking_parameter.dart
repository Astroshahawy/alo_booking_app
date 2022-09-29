import 'package:equatable/equatable.dart';

class GetBookingsParameters extends Equatable {
  final String token;

  const GetBookingsParameters(this.token);

  @override
  List<Object> get props => [token];
}
