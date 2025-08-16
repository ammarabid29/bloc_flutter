import 'package:bloc_flutter/favorite_app/bloc/items_bloc.dart';
import 'package:bloc_flutter/favorite_app/bloc/items_event.dart';
import 'package:bloc_flutter/favorite_app/bloc/items_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsView extends StatefulWidget {
  const ItemsView({super.key});

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  _fetchItems() {
    context.read<ItemsBloc>().add(FetchItemsListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Items"),
        actions: [
          BlocBuilder<ItemsBloc, ItemsState>(
            builder: (context, state) {
              if (state.tempitems.isEmpty) {
                return SizedBox();
              } else {
                return IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    context.read<ItemsBloc>().add(DeleteItemEvent());
                  },
                );
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<ItemsBloc, ItemsState>(
        builder: (context, state) {
          switch (state.status) {
            case ListStatus.loading:
              return Center(child: CircularProgressIndicator());
            case ListStatus.success:
              if (state.items.isEmpty) {
                return Center(child: Text("No items found"));
              }
              return _ItemsList(state: state);
            case ListStatus.failure:
              return Center(child: Text("Failed to load items"));
          }
        },
      ),
    );
  }
}

class _ItemsList extends StatelessWidget {
  final ItemsState state;
  const _ItemsList({required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        final item = state.items[index];
        return ListTile(
          leading: Checkbox(
            value: state.tempitems.contains(item) ? true : false,
            onChanged: (value) {
              if (value == true) {
                context.read<ItemsBloc>().add(SelectItemEvent(itemModel: item));
              } else {
                context.read<ItemsBloc>().add(
                  UnselectItemEvent(itemModel: item),
                );
              }
            },
          ),
          title: Text(item.value),
          trailing: IconButton(
            icon: Icon(
              item.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              final updatedItem = item.copyWith(isFavorite: !item.isFavorite);
              context.read<ItemsBloc>().add(
                AddFavoriteEvent(itemModel: updatedItem),
              );
            },
          ),
        );
      },
    );
  }
}
