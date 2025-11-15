import 'package:flutter/material.dart';
import 'menu.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          Container(
            width: double.infinity,
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
            child: Stack(
              children: [
                // Background Pattern
                Positioned(
                  top: -50,
                  right: -50,
                  child: Opacity(
                    opacity: 0.1,
                    child: Text(
                      '🌿',
                      style: TextStyle(fontSize: 200),
                    ),
                  ),
                ),
                
                // Content
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Identifikasi Rempah Indonesia',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Navigate ke Upload page (index 3)
                          Menu.navigateToPage(context, 3);
                        },
                        icon: const Icon(Icons.search),
                        label: const Text('Mulai Identifikasi'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF2E7D32),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 18,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Fitur Unggulan
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Fitur Unggulan',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                
                _buildFeatureCard(
                  context,
                  icon: Icons.flash_on,
                  title: 'Identifikasi Cepat',
                  description: 'Hanya butuh beberapa detik untuk mengidentifikasi rempah Anda dengan akurat',
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
                  ),
                ),
                
                const SizedBox(height: 15),
                
                _buildFeatureCard(
                  context,
                  icon: Icons.gps_fixed,
                  title: 'Akurasi Tinggi',
                  description: 'Akurasi hingga 85% dengan Machine Learning terkini',
                  gradient: const LinearGradient(
                    colors: [Color(0xFFC8E6C9), Color(0xFFA5D6A7)],
                  ),
                ),
                
                const SizedBox(height: 15),
                
                _buildFeatureCard(
                  context,
                  icon: Icons.phone_android,
                  title: 'Mudah Digunakan',
                  description: 'Interface yang simple dan intuitif untuk semua kalangan pengguna',
                  gradient: const LinearGradient(
                    colors: [Color(0xFFA5D6A7), Color(0xFF81C784)],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Jenis-Jenis Rempah Preview
                Text(
                  'Jenis-Jenis Rempah',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 15),
                
                // Grid 2x2 untuk rempah
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    _buildSpiceGridCard(
                      context,
                      emoji: '🫚',
                      name: 'Jahe',
                      latinName: 'Zingiber officinale',
                      imagePath: 'assets/images/jahe.jpg',
                      color: const Color(0xFFD4A574),
                    ),
                    _buildSpiceGridCard(
                      context,
                      emoji: '🌱',
                      name: 'Kencur',
                      latinName: 'Kaempferia galanga',
                      imagePath: 'assets/images/kencur.jpg',
                      color: const Color(0xFFE8D5B7),
                    ),
                    _buildSpiceGridCard(
                      context,
                      emoji: '🧡',
                      name: 'Kunyit',
                      latinName: 'Curcuma longa',
                      imagePath: 'assets/images/kunyit.jpg',
                      color: const Color(0xFFFFD54F),
                    ),
                    _buildSpiceGridCard(
                      context,
                      emoji: '🌶️',
                      name: 'Lengkuas',
                      latinName: 'Alpinia galanga',
                      imagePath: 'assets/images/lengkuas.jpg',
                      color: const Color(0xFFFFAB91),
                    ),
                  ],
                ),
                
                const SizedBox(height: 30),
                
                // Cara Menggunakan
                Text(
                  'Cara Menggunakan',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                
                _buildStepCard(
                  context,
                  number: '1',
                  icon: Icons.upload_file,
                  title: 'Upload Gambar',
                  description: 'Pilih atau ambil gambar rempah yang ingin diidentifikasi',
                ),
                
                const SizedBox(height: 15),
                
                _buildStepCard(
                  context,
                  number: '2',
                  icon: Icons.psychology,
                  title: 'Proses',
                  description: 'Sistem akan menganalisis dalam hitungan detik',
                ),
                
                const SizedBox(height: 15),
                
                _buildStepCard(
                  context,
                  number: '3',
                  icon: Icons.check_circle,
                  title: 'Hasil Prediksi',
                  description: 'Dapatkan hasil lengkap dengan informasi detail',
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Gradient gradient,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF2E7D32),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpiceGridCard(
    BuildContext context, {
    required String emoji,
    required String name,
    required String latinName,
    required String imagePath,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigate ke Detail Page dengan nama rempah
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: name,
        );
      },
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback ke emoji
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        emoji,
                        style: const TextStyle(fontSize: 50),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                latinName,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF757575),
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCard(
    BuildContext context, {
    required String number,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Icon(
            icon,
            color: const Color(0xFF2E7D32),
            size: 40,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}