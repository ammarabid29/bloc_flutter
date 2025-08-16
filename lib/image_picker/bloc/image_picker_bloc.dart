import 'package:bloc_flutter/utils/image_picker_utils.dart';
import 'package:bloc_flutter/image_picker/bloc/image_picker_event.dart';
import 'package:bloc_flutter/image_picker/bloc/image_picker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapturedEvent>(_cameraCaptured);

    on<GallerySelectedEvent>(_gallerySelected);
  }

  void _cameraCaptured(
    CameraCapturedEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    await imagePickerUtils
        .pickImageFromCamera()
        .then((image) {
          emit(state.copyWith(imageFile: image));
        })
        .catchError((error) {
          // Handle error if needed
          emit(state.copyWith(imageFile: null));
        });
  }

  void _gallerySelected(
    GallerySelectedEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    await imagePickerUtils
        .pickImageFromGallery()
        .then((image) {
          emit(state.copyWith(imageFile: image));
        })
        .catchError((error) {
          // Handle error if needed
          emit(state.copyWith(imageFile: null));
        });
  }
}
