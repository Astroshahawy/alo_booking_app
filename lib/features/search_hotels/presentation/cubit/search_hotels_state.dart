import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:equatable/equatable.dart';

abstract class SearchHotelsState extends Equatable {
  const SearchHotelsState();
}

class SearchHotelsInitialState extends SearchHotelsState {
  @override
  List<Object?> get props => [];
}

class UserSearchHotelsLoadingState extends SearchHotelsState {
  @override
  List<Object?> get props => [];
}

class UserSearchHotelsSuccessState extends SearchHotelsState {
  @override
  List<Object?> get props => [];
}

class SearchHotelsErrorState extends SearchHotelsState {
  final PrimaryServerException exception;

  const SearchHotelsErrorState({
    required this.exception,
  });

  @override
  List<Object> get props => [exception];
}
