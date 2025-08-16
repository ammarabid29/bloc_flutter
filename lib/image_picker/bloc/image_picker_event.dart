import 'package:equatable/equatable.dart';

sealed class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object?> get props => [];
}

class CameraCapturedEvent extends ImagePickerEvent {}

class GallerySelectedEvent extends ImagePickerEvent {}
