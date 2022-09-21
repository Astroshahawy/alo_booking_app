part of 'hotels_cubit.dart';

@immutable
abstract class HotelsState {}

class HotelsInitial extends HotelsState {}
class GetHotelsLoadingState extends HotelsState{}
class GetHotelsSucessState extends HotelsState{}
class GetHotelsErrorState extends HotelsState {
  final PrimaryServerException exception;

  GetHotelsErrorState({
    required this.exception,
  });
}
