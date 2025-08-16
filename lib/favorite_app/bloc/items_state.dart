import 'package:bloc_flutter/favorite_app/model/item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class ItemsState extends Equatable {
  final List<ItemModel> items;
  final List<ItemModel> tempitems;
  final ListStatus status;
  const ItemsState({
    this.items = const [],
    this.tempitems = const [],
    this.status = ListStatus.loading,
  });

  ItemsState copyWith({
    List<ItemModel>? items,
    ListStatus? status,
    List<ItemModel>? tempitems,
  }) {
    return ItemsState(
      items: items ?? this.items,
      tempitems: tempitems ?? this.tempitems,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [items, status, tempitems];
}
