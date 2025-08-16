import 'package:equatable/equatable.dart';

class ItemModel extends Equatable {
  final String id;
  final String value;
  final bool isFavorite;
  final bool isDeleting;

  const ItemModel({
    required this.id,
    required this.value,
    this.isFavorite = false,
    this.isDeleting = false,
  });

  ItemModel copyWith({
    String? id,
    String? value,
    bool? isFavorite,
    bool? isDeleting,
  }) {
    return ItemModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isFavorite: isFavorite ?? this.isFavorite,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  @override
  List<Object?> get props => [id, value, isFavorite, isDeleting];
}
