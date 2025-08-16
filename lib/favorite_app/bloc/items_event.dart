import 'package:bloc_flutter/favorite_app/model/item_model.dart';
import 'package:equatable/equatable.dart';

sealed class ItemsEvent extends Equatable {
  const ItemsEvent();

  @override
  List<Object?> get props => [];
}

class FetchItemsListEvent extends ItemsEvent {}

class AddFavoriteEvent extends ItemsEvent {
  final ItemModel itemModel;
  const AddFavoriteEvent({required this.itemModel});

  @override
  List<Object?> get props => [itemModel];
}

class SelectItemEvent extends ItemsEvent {
  final ItemModel itemModel;
  const SelectItemEvent({required this.itemModel});

  @override
  List<Object?> get props => [itemModel];
}

class UnselectItemEvent extends ItemsEvent {
  final ItemModel itemModel;
  const UnselectItemEvent({required this.itemModel});

  @override
  List<Object?> get props => [itemModel];
}

class DeleteItemEvent extends ItemsEvent {}
