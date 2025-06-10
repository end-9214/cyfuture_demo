import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'result_screen.dart'; // Import the ResultScreen

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  File? _image;
  final picker = ImagePicker();
  Uint8List? _webImageBytes;
  XFile? _pickedFile;

  Future<void> _pickImage(ImageSource source) async {
    final picked = await picker.pickImage(source: source);
    if (picked != null) {
      _pickedFile = picked;
      if (kIsWeb) {
        final bytes = await picked.readAsBytes();
        setState(() {
          _webImageBytes = bytes;
          _image = null;
        });
      } else {
        setState(() {
          _image = File(picked.path);
          _webImageBytes = null;
        });
      }
      // Automatically upload after picking
      await _uploadImage();
    }
  }

  String getApiUrl() {
    if (kIsWeb) {
      return 'http://localhost:8000/api/scan-barcode/';
    } else {
      return 'http://10.0.2.2:8000/api/scan-barcode/';
    }
  }

  Future<void> _uploadImage() async {
    if (_pickedFile == null) return;
    final uri = Uri.parse(getApiUrl());
    var request = http.MultipartRequest('POST', uri);
    if (kIsWeb) {
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          _webImageBytes!,
          filename: _pickedFile!.name,
        ),
      );
    } else {
      request.files.add(
        await http.MultipartFile.fromPath('image', _image!.path),
      );
    }
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Navigate to result screen with data
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(data: data),
        ),
      );
    } else {
      final error = jsonDecode(response.body)['error'] ?? 'Unknown error';
      _showErrorDialog(error);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Waste')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (kIsWeb && _webImageBytes != null)
            Image.memory(_webImageBytes!, height: 250)
          else if (_image != null)
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
