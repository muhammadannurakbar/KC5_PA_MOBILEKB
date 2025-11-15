import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PredictionProvider with ChangeNotifier {
  File? imageFile;
  String? predictionMessage;
  final ImagePicker _picker = ImagePicker();

  // Fungsi untuk mengambil gambar dari galeri atau kamera
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Fungsi untuk mengirim gambar ke API dan mendapatkan prediksi
  Future<void> predictImage(File? images) async {
    final url = Uri.parse('https://mobile.loca.lt/api/predict-image'); // Ganti dengan URL API kamu
    final request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('image', images!.path));  // Pastikan field image sesuai

    // (Optional) Tambahkan header jika API memerlukannya
    request.headers.addAll({
      'Content-Type': 'multipart/form-data', 
      // 'Authorization': 'Bearer YOUR_TOKEN', // Tambahkan jika perlu
    });

    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      print('Response status: ${response.statusCode}');
      print('Response body: $responseData');
      if (response.statusCode == 200) {
        final data = jsonDecode(responseData);
        
        if (data['prediction'] != null && data['prediction'].isNotEmpty) {
          // Mengambil hasil prediksi pertama
          int prediction = data['prediction'][0];
          String? pred_label;
          if (prediction == 0) {
            pred_label = "Jahe";
          } else if (prediction == 1){
            pred_label = "Kencur";
          } else if (prediction == 2){
            pred_label = "Kunyit";
          } else if (prediction == 3){
            pred_label = "Lengkuas";
          }
          predictionMessage = pred_label;
        } else {
          predictionMessage = 'Prediction failed';
        }
      } else {
        // Jika error, tampilkan pesan error
        predictionMessage = 'Error ${response.statusCode}: $responseData';
      }

      notifyListeners();
    } catch (e) {
      predictionMessage = 'Error: $e';
      notifyListeners();
    }
  }

  // Fungsi untuk menghapus gambar dan prediksi
  void clear() {
    imageFile = null;
    predictionMessage = null;
    notifyListeners();
  }
}
