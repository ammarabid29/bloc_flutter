import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerUtils {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImageFromCamera() async {
    final status = await Permission.camera.request();

    if (status.isGranted) {
      try {
        final XFile? image = await _picker.pickImage(source: ImageSource.camera);
        return image;
      } catch (e) {
        // Handle error (e.g., show snackbar or print)
        return null;
      }
    } else {
      // Optionally: Show permission denied message
      return null;
    }
  }

  Future<XFile?> pickImageFromGallery() async {
    final status = await Permission.photos.request(); // for iOS
    final storageStatus = await Permission.storage.request(); // for Android

    if (status.isGranted || storageStatus.isGranted) {
      try {
        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        return image;
      } catch (e) {
        // Handle error
        return null;
      }
    } else {
      // Optionally: Show permission denied message
      return null;
    }
  }
}
