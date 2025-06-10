import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  Uint8List? _webImageBytes;
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final picked = await picker.pickImage(source: source);
    if (picked != null) {
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
    }
  }

  String getApiUrl() {
    if (kIsWeb) {
      return 'http://localhost:8000/api/scan-barcode/';
    } else {
      return 'http://10.0.2.2:8000/api/scan-barcode/';
    }
  }

  Future<void> _uploadImage(File image) async {
    final uri = Uri.parse(getApiUrl());
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', image.path));

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _showResultDialog(data);
    } else {
      final error = jsonDecode(response.body)['error'] ?? 'Unknown error';
      _showErrorDialog(error);
    }
  }

  void _showResultDialog(Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Scan Result'),
        content: Text(
          'Barcode: ${data['barcode'] ?? 'N/A'}\nEcoScore: ${data['ecoscore_data'] ?? 'N/A'}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/animations/earth_day_celebration.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/animations/symbol_animation.gif',
                  height: 150,
                ),
                const SizedBox(height: 20),
                _webImageBytes != null
                    ? Image.memory(_webImageBytes!, height: 150)
                    : _image != null
                        ? Image.file(_image!, height: 150)
                        : const Text(
                            'No image selected',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  child: const Text('Capture Image'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _image == null
                      ? null
                      : () => _uploadImage(_image!),
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
