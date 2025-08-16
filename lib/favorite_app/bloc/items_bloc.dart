import 'package:bloc_flutter/favorite_app/bloc/items_event.dart';
import 'package:bloc_flutter/favorite_app/bloc/items_state.dart';
import 'package:bloc_flutter/favorite_app/model/item_model.dart';
import 'package:bloc_flutter/favorite_app/repo/item_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final ItemRepo itemRepo;
  ItemsBloc(this.itemRepo) : super(const ItemsState()) {
    on<FetchItemsListEvent>(fetchItemsList);
    on<AddFavoriteEvent>(_addFavorite);
    on<SelectItemEvent>(_selectItem);
    on<UnselectItemEvent>(_unselectItem);
    on<DeleteItemEvent>(_deleteItem);
  }

  List<ItemModel> itemsList = [];
  List<ItemModel> tempItemsList = [];

  void fetchItemsList(
    FetchItemsListEvent event,
    Emitter<ItemsState> emit,
  ) async {
    try {
      itemsList = await itemRepo.fetchItems();

      emit(
        state.copyWith(items: List.from(itemsList), status: ListStatus.success),
      );
    } catch (error) {
      emit(state.copyWith(status: ListStatus.failure));
    }
  }

  void _addFavorite(AddFavoriteEvent event, Emitter<ItemsState> emit) {
    final currentState = state;
    final index = itemsList.indexWhere((item) => item.id == event.itemModel.id);

    if (event.itemModel.isFavorite) {
      if (tempItemsList.contains(itemsList[index])) {
        tempItemsList.remove(itemsList[index]);
        tempItemsList.add(event.itemModel);
      }
    } else {
      if (tempItemsList.contains(itemsList[index])) {
        tempItemsList.remove(itemsList[index]);
        tempItemsList.add(event.itemModel);
      }
    }

    itemsList[index] = event.itemModel;
    emit(
      currentState.copyWith(
        items: List.from(itemsList),
        tempitems: List.from(tempItemsList),
      ),
    );
  }

  void _selectItem(SelectItemEvent event, Emitter<ItemsState> emit) {
    final currentState = state;
    tempItemsList.add(event.itemModel);
    emit(currentState.copyWith(tempitems: List.from(tempItemsList)));
  }

  void _unselectItem(UnselectItemEvent event, Emitter<ItemsState> emit) {
    final currentState = state;
    tempItemsList.remove(event.itemModel);
    emit(currentState.copyWith(tempitems: List.from(tempItemsList)));
  }

  void _deleteItem(DeleteItemEvent event, Emitter<ItemsState> emit) {
    final currentState = state;

    for (var i = 0; i < tempItemsList.length; i++) {
      itemsList.remove(tempItemsList[i]);
    }

    tempItemsList.clear();
    emit(
      currentState.copyWith(
        items: List.from(itemsList),
        tempitems: List.from(tempItemsList),
      ),
    );
  }
}
