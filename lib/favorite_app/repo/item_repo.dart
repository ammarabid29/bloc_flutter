import 'package:bloc_flutter/favorite_app/model/item_model.dart';

class ItemRepo {
  const ItemRepo();

  Future<List<ItemModel>> fetchItems() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generateItems(10));
  }

  List<ItemModel> _generateItems(int length) {
    return List.generate(
      length,
      (index) => ItemModel(id: '$index', value: 'Item $index'),
    );
  }
}
