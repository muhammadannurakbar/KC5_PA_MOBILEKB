import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE8F5E9),
                  Color(0xFFC8E6C9),
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E7D32),
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.eco,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Tentang REMPAH.ID',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Melestarikan Pengetahuan Rempah Indonesia',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF424242),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                
                // Deskripsi Aplikasi
                _buildInfoCard(
                  context,
                  icon: Icons.info_outline,
                  title: 'Apa itu REMPAH.ID?',
                  content: 
                    'REMPAH.ID adalah platform inovatif yang menggabungkan teknologi Artificial Intelligence dengan kearifan lokal Indonesia untuk membantu masyarakat mengenali dan memahami berbagai jenis rempah-rempah Indonesia.\n\n'
                    'Dengan menggunakan teknologi Machine Learning dan Computer Vision, kami memudahkan siapa saja untuk mengidentifikasi rempah hanya dengan foto.',
                ),

                const SizedBox(height: 20),

                // Visi & Misi Section
                Text(
                  'Visi & Misi',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 15),

                _buildVisionMissionCard(
                  context,
                  icon: Icons.visibility,
                  title: 'Visi',
                  description: 'Menjadi platform rujukan utama untuk identifikasi dan edukasi rempah-rempah Indonesia',
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
                  ),
                ),

                const SizedBox(height: 15),

                _buildVisionMissionCard(
                  context,
                  icon: Icons.rocket_launch,
                  title: 'Misi 1',
                  description: 'Memudahkan masyarakat dalam mengenali jenis-jenis rempah Indonesia dengan cepat dan akurat',
                  gradient: const LinearGradient(
                    colors: [Color(0xFFC8E6C9), Color(0xFFA5D6A7)],
                  ),
                ),

                const SizedBox(height: 15),

                _buildVisionMissionCard(
                  context,
                  icon: Icons.menu_book,
                  title: 'Misi 2',
                  description: 'Menyediakan informasi lengkap dan edukatif tentang manfaat, penggunaan, dan cara penyimpanan rempah',
                  gradient: const LinearGradient(
                    colors: [Color(0xFFA5D6A7), Color(0xFF81C784)],
                  ),
                ),

                const SizedBox(height: 15),

                _buildVisionMissionCard(
                  context,
                  icon: Icons.public,
                  title: 'Misi 3',
                  description: 'Melestarikan dan mempromosikan kekayaan rempah Indonesia ke dunia internasional',
                  gradient: const LinearGradient(
                    colors: [Color(0xFF81C784), Color(0xFF66BB6A)],
                  ),
                ),

                const SizedBox(height: 30),

                // Tim Kami Section
                Text(
                  'Tim Kami',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 15),

                // Grid Anggota Tim
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    _buildTeamMemberCard(
                      context,
                      name: 'Muhammad Annur Akbar',
                      nim: '2309106110',
                    ),
                    _buildTeamMemberCard(
                      context,
                      name: 'Nelsi',
                      nim: '2309106120',
                    ),
                    _buildTeamMemberCard(
                      context,
                      name: 'Putri Tendry Zahrany',
                      nim: '2309106116',
                    ),
                    _buildTeamMemberCard(
                      context,
                      name: 'Muhammad Rio Prasetiawan',
                      nim: '2409106123',
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Footer
                Center(
                  child: Column(
                    children: [
                      Text(
                        '© 2024 REMPAH.ID',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF757575),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF2E7D32),
                size: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _buildVisionMissionCard(
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
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF2E7D32),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMemberCard(
    BuildContext context, {
    required String name,
    required String nim,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8F5E9),
            Color(0xFFC8E6C9),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Avatar
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFF2E7D32),
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          
          // Name
          Text(
            name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2E7D32),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          
          // NIM
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF2E7D32),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              nim,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}