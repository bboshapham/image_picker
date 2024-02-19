import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImagePickerScreen(),
    );
  }
}

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  XFile? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    XFile? pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      _imageFile = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Demo'),
      ),
      body: Center(
        child: _imageFile == null
            ? const Text('No image selected')
            : Image.file(File(_imageFile!.path)),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.camera),
            tooltip: 'Pick Image from Camera',
            child: const Icon(Icons.camera),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            tooltip: 'Pick Image from Gallery',
            child: const Icon(Icons.image),
          ),
        ],
      ),
    );
  }
}
