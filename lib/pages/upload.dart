import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:rempah_id/controller/controller.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadPageState();
}

class _UploadPageState extends State<Upload> {
  File? _selectedImage;
  bool _isProcessing = false;
  bool _hasResult = false;
  String? _predictedSpice;
  double? _confidence;
  final ImagePicker _picker = ImagePicker();

  // Dummy data untuk prediksi
  final List<Map<String, dynamic>> _spices = [
    {'name': 'Jahe', 'emoji': '🫚', 'color': const Color(0xFFD4A574)},
    {'name': 'Kencur', 'emoji': '🌱', 'color': const Color(0xFFE8D5B7)},
    {'name': 'Kunyit', 'emoji': '🧡', 'color': const Color(0xFFFFD54F)},
    {'name': 'Lengkuas', 'emoji': '🌶️', 'color': const Color(0xFFFFAB91)},
  ];

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
          _hasResult = false;
          _predictedSpice = null;
          _confidence = null;
        });
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog('Gagal mengambil gambar: $e');
      }
    }
  }

  Future<void> _processImage() async {
  final predictionProvider = context.read<PredictionProvider>();

  if (_selectedImage == null) {
    _showErrorDialog('Silakan pilih gambar terlebih dahulu');
    return;
  }

  setState(() {
    _isProcessing = true;
  });

  if (!mounted) return;

  await predictionProvider.predictImage(_selectedImage);

  if (!mounted) return;

  setState(() {
    _isProcessing = false;
    _hasResult = true;
  });

  _showSuccessDialog();
}


  void _reset() {
    setState(() {
      _selectedImage = null;
      _hasResult = false;
      _predictedSpice = null;
      _confidence = null;
      _isProcessing = false;
    });
  }

  void _showErrorDialog(String message) {
    if (!mounted) return;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Row(
          children: const [
            Icon(Icons.error, color: Colors.red),
            SizedBox(width: 10),
            Text('Error'),
          ],
        ),
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

  void _showSuccessDialog() {
    final predictionProvider = Provider.of<PredictionProvider>(context, listen: false);
    
    if (!mounted) return;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Row(
          children: const [
            Icon(Icons.check_circle, color: Color(0xFF2E7D32)),
            SizedBox(width: 10),
            Text('Berhasil!'),
          ],
        ),
        content: Text(
          'Rempah berhasil diidentifikasi sebagai ${(predictionProvider.predictionMessage)}',
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF2E7D32),
                  Color(0xFF1B5E20),
                ],
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.upload_file,
                  size: 50,
                  color: Colors.white,
                ),
                const SizedBox(height: 15),
                Text(
                  'Identifikasi Rempah',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Upload foto untuk mengidentifikasi',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Upload Section
                if (_selectedImage == null) ...[
                  _buildUploadZone(),
                  const SizedBox(height: 30),
                ] else ...[
                  _buildImagePreview(),
                  const SizedBox(height: 20),
                  if (_hasResult) _buildResultCard() else _buildActionButtons(),
                  const SizedBox(height: 30),
                ],

                // Info Cards
                _buildInfoCard(
                  icon: Icons.info_outline,
                  title: 'Format yang Didukung',
                  description: 'JPG, JPEG, PNG (Max 10 MB)',
                  color: const Color(0xFF2196F3),
                ),

                const SizedBox(height: 15),

                _buildInfoCard(
                  icon: Icons.gps_fixed,
                  title: 'Akurasi Sistem',
                  description: 'Akurasi hingga 80%',
                  color: const Color(0xFF4CAF50),
                ),

                const SizedBox(height: 15),

                _buildInfoCard(
                  icon: Icons.speed,
                  title: 'Proses Cepat',
                  description: 'Hasil dalam hitungan detik',
                  color: const Color(0xFFFF9800),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadZone() {
    return InkWell(
      onTap: _pickImageFromGallery,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF2E7D32),
            width: 3,
            style: BorderStyle.solid,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.add_photo_alternate,
                size: 60,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Upload Gambar Rempah',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Tap untuk memilih gambar',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF757575),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '📁 Pilih Gambar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.file(
              _selectedImage!,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: Color(0xFF4CAF50)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Gambar siap diproses',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _reset,
                  icon: const Icon(Icons.close, color: Colors.red),
                  tooltip: 'Hapus gambar',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _isProcessing ? null : _processImage,
            icon: _isProcessing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.search),
            label: Text(_isProcessing ? 'Memproses...' : 'Identifikasi Rempah'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _isProcessing ? null : _reset,
            icon: const Icon(Icons.refresh),
            label: const Text('Pilih Ulang'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              side: const BorderSide(color: Color(0xFF2E7D32), width: 2),
              foregroundColor: const Color(0xFF2E7D32),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard() {
    final predictionProvider = context.read<PredictionProvider>();

    // Map nama ke path gambar
    final Map<String, String> imagePaths = {
      'Jahe': 'assets/images/jahe.jpg',
      'Kencur': 'assets/images/kencur.jpg',
      'Kunyit': 'assets/images/kunyit.jpg',
      'Lengkuas': 'assets/images/lengkuas.jpg',
    };

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF2E7D32),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.check_circle, color: Color(0xFF2E7D32), size: 28),
              SizedBox(width: 10),
              Text(
                'Hasil Identifikasi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipOval(
            child: Image.asset(
              imagePaths[predictionProvider.predictionMessage] ?? '',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback ke emoji
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      predictionProvider.predictionMessage.toString(),
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Text(
            predictionProvider.predictionMessage!,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: predictionProvider.predictionMessage, // Kirim nama rempah hasil prediksi
                );
              },
              icon: const Icon(Icons.article),
              label: const Text('Lihat Detail Lengkap'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _reset,
              icon: const Icon(Icons.refresh),
              label: const Text('Upload Lagi'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                side: const BorderSide(color: Color(0xFF2E7D32), width: 2),
                foregroundColor: const Color(0xFF2E7D32),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}