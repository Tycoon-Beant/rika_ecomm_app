import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';




class ImageSelection extends StatelessWidget {
  final Function(File) onImageSelected;

  const ImageSelection({required this.onImageSelected, Key? key})
      : super(key: key);

  Future<File> compressImageWithFlutter(File imageFile) async {
    final compressedBytes = await FlutterImageCompress.compressWithFile(
      imageFile.absolute.path,
      quality: 85,
    );

    final tempDir = Directory.systemTemp;
    final compressedFile = File('${tempDir.path}/compressed_image.jpg');
    return await compressedFile.writeAsBytes(compressedBytes!);
  }

  Future<void> _pickAndCompressImage(
      BuildContext context, ImageSource source) async {
    try {
      final picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        final selectedFile = File(pickedFile.path);
        final compressedFile = await compressImageWithFlutter(selectedFile);
        Navigator.of(context).pop();
        onImageSelected(compressedFile);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error selecting image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => _pickAndCompressImage(context, ImageSource.camera),
            icon: const Icon(Icons.camera_alt_outlined),
            color: Colors.black,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () =>
                _pickAndCompressImage(context, ImageSource.gallery),
            icon: const Icon(Icons.file_present_outlined),
            color: Colors.black,
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}