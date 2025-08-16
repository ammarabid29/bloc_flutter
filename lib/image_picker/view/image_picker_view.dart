import 'dart:io';

import 'package:bloc_flutter/image_picker/bloc/image_picker_bloc.dart';
import 'package:bloc_flutter/image_picker/bloc/image_picker_event.dart';
import 'package:bloc_flutter/image_picker/bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerView extends StatelessWidget {
  const ImagePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker View")),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            return state.imageFile == null
                ? InkWell(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(
                        CameraCapturedEvent(),
                      );
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.camera_alt),
                    ),
                  )
                : Center(
                    child: Image.file(
                      File(state.imageFile!.path.toString()),
                      fit: BoxFit.cover,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
