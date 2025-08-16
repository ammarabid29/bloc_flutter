import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable {
  final XFile? imageFile;

  const ImagePickerState({this.imageFile});

  ImagePickerState copyWith({XFile? imageFile}) {
    return ImagePickerState(imageFile: imageFile ?? this.imageFile);
  }

  @override
  List<Object?> get props => [imageFile];
}
