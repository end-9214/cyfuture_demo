import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final picked = await picker.pickImage(source: source);
    if (picked != null) {
      setState(() => _image = File(picked.path));
      // TODO: Process with TFLite
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Waste')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_image != null)
            Image.file(_image!, height: 250)
          else
            const Text('No image selected'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt),
                label: const Text('Camera'),
              ),
              ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.gallery),
                icon: const Icon(Icons.photo),
                label: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
