import 'package:equatable/equatable.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class PostFetchedEvent extends PostEvent {}

class SearchPostEvent extends PostEvent {
  final String searchKey;

  const SearchPostEvent(this.searchKey);

  @override
  List<Object?> get props => [searchKey];
}
