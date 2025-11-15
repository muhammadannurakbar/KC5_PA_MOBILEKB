import 'package:flutter/material.dart';

class SpiceModel {
  final String name;
  final String latinName;
  final String emoji;
  final String imagePath;
  final Color color;
  final List<String> benefits;
  final String description;

  SpiceModel({
    required this.name,
    required this.latinName,
    required this.emoji,
    required this.imagePath,
    required this.color,
    required this.benefits,
    required this.description,
  });
}

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<SpiceModel> _allSpices = [
    SpiceModel(
      name: 'Jahe',
      latinName: 'Zingiber officinale',
      emoji: '🫚',
      imagePath: 'assets/images/jahe.jpg',
      color: const Color(0xFFD4A574),
      benefits: ['Anti-inflamasi', 'Pencernaan', 'Imunitas'],
      description: 'Rempah dengan rasa pedas hangat, banyak digunakan dalam minuman dan masakan tradisional Indonesia.',
    ),
    SpiceModel(
      name: 'Kencur',
      latinName: 'Kaempferia galanga',
      emoji: '🌱',
      imagePath: 'assets/images/kencur.jpg',
      color: const Color(0xFFE8D5B7),
      benefits: ['Pereda Batuk', 'Stamina', 'Afrodisiak'],
      description: 'Rimpang dengan aroma khas, sering digunakan dalam jamu dan beras kencur.',
    ),
    SpiceModel(
      name: 'Kunyit',
      latinName: 'Curcuma longa',
      emoji: '🧡',
      imagePath: 'assets/images/kunyit.jpg',
      color: const Color(0xFFFFD54F),
      benefits: ['Antioksidan', 'Anti-inflamasi', 'Liver'],
      description: 'Rempah berwarna kuning cerah dengan kandungan kurkumin yang tinggi.',
    ),
    SpiceModel(
      name: 'Lengkuas',
      latinName: 'Alpinia galanga',
      emoji: '🌶️',
      imagePath: 'assets/images/lengkuas.jpg',
      color: const Color(0xFFFFAB91),
      benefits: ['Antibakteri', 'Pencernaan', 'Rematik'],
      description: 'Rimpang aromatik yang sering digunakan dalam masakan berkuah dan gulai.',
    ),
  ];

  List<SpiceModel> get _filteredSpices {
    if (_searchQuery.isEmpty) {
      return _allSpices;
    }
    return _allSpices.where((spice) {
      return spice.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          spice.latinName.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                Icons.photo_library,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(height: 15),
              Text(
                'Galeri Rempah Indonesia',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Jelajahi koleksi lengkap rempah-rempah',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        // Search Bar
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Cari rempah...',
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xFF2E7D32),
              ),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          _searchQuery = '';
                        });
                      },
                    )
                  : null,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Color(0xFFE8F5E9),
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Color(0xFFE8F5E9),
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Color(0xFF2E7D32),
                  width: 2,
                ),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
        ),

        // Result Count
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_filteredSpices.length} Rempah Ditemukan',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF757575),
                ),
              ),
              if (_searchQuery.isNotEmpty)
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _searchQuery = '';
                    });
                  },
                  icon: const Icon(Icons.clear_all, size: 18),
                  label: const Text('Reset'),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF2E7D32),
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // Spices Grid
        Expanded(
          child: _filteredSpices.isEmpty
              ? _buildEmptyState()
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: _filteredSpices.length,
                  itemBuilder: (context, index) {
                    return _buildSpiceCard(_filteredSpices[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildSpiceCard(SpiceModel spice) {
    return GestureDetector(
      onTap: () {
        _showSpiceDetail(spice);
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image/Emoji Section
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  spice.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback ke emoji jika gambar error
                    return Container(
                      color: spice.color,
                      child: Center(
                        child: Text(
                          spice.emoji,
                          style: const TextStyle(fontSize: 60),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Info Section
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      spice.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      spice.latinName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: const Color(0xFF757575),
                        fontSize: 11,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E7D32),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.info,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Detail',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off,
              size: 80,
              color: Color(0xFFBDBDBD),
            ),
            const SizedBox(height: 20),
            Text(
              'Rempah Tidak Ditemukan',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: const Color(0xFF757575),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Coba gunakan kata kunci lain',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF9E9E9E),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _searchController.clear();
                  _searchQuery = '';
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Reset Pencarian'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSpiceDetail(SpiceModel spice) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              // Handle Bar
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFBDBDBD),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        spice.imagePath,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback ke emoji
                          return Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: spice.color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                spice.emoji,
                                style: const TextStyle(fontSize: 100),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Name
                    Text(
                      spice.name,
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      spice.latinName,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: const Color(0xFF757575),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 25),

                    // Description
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.description,
                            color: Color(0xFF2E7D32),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              spice.description,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Benefits
                    Text(
                      'Manfaat Utama',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    const SizedBox(height: 12),

                    ...spice.benefits.map((benefit) => Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xFF2E7D32),
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  benefit,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),

                    const SizedBox(height: 20),

                    // Action Button
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context); // Tutup modal
                        Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: spice.name, // Kirim nama rempah
                        );
                      },
                      icon: const Icon(Icons.article),
                      label: const Text('Lihat Detail Lengkap'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}